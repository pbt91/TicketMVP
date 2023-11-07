$(function(){
	//예매Id생성
	function generateUniqueOrderId() {
		const minValue = 100000000; 
	    const maxValue = 999999999; 
	    
	    return Math.floor(Math.random() * (maxValue - minValue + 1)) + minValue;
    }
	
	let orderId = generateUniqueOrderId();
	checkDuplicate(orderId);
	
	// 중복 확인
	function checkDuplicate(orderId) {
	    $.ajax({
		    type: "GET", 
		    url: "/TicketMvp/reserve/ReserveIdCheck.do",
		    data: { orderIdStr : orderId },
		    success: function(response) {
   				if(response === "success") {
   					console.log("중복없음");
   				}  else if (response === "failure") {
                    console.log("중복있음");
                    orderId = generateUniqueOrderId();
                    checkDuplicate(orderId);
                } else {
                	console.log("중복확인 도중 오류");
                }
            },
		    error: function(xhr, status, error) {
		        console.log("AJAX 실패: " + status + " - " + error);
    			console.log(xhr.responseText);
		    }
		});
    }
	
	//path에 프로젝트명 넣기
    let path = "/TicketMvp/";
	
	//경기Id 가져오기
	let matchId = $("input#matchid").val();
    
    //전화번호 포멧 함수
    function formatPhoneNumber(phoneNumber) {
		// 02로 시작하면
	    if (phoneNumber.startsWith('02') && (phoneNumber.length === 9 || phoneNumber.length === 10)) {
	        return phoneNumber.replace(/(02)(\d{3,4})(\d{4})/, "$1-$2-$3");
	    } 
	    // 010로 시작하면
	    else if (phoneNumber.startsWith('010') && phoneNumber.length === 11) {
	        return phoneNumber.replace(/(010)(\d{4})(\d{4})/, "$1-$2-$3");
	    } else {
	        return phoneNumber;
	    }
	}
    
    // 전화번호 포멧 후 다시 표기  
    let currentPhoneNumber = $("span#userPhone").text().trim();
    $("span#userPhone").text(formatPhoneNumber(currentPhoneNumber));
    
    // 전화번호 수정시 입력창
    $("#editPhone").click(function() {
        $(this).hide(); 
	    $("span#userPhone").hide(); 
	    $("#userPhoneInput").val($("span#userPhone").data("phone")); 
	    $("#userPhoneInput").show();
	    $("#savePhone").show(); 
    });

	
    // 새 전화번호 입력
    $("#savePhone").click(function() {
        let newPhoneNumber = $("#userPhoneInput").val().trim();
        let isValidPhone = /^(02[0-9]{7,8}|010[0-9]{8})$/.test(newPhoneNumber);
        if (isValidPhone) {
	       $("span#userPhone").text(formatPhoneNumber(newPhoneNumber))
                           .attr('data-phone', newPhoneNumber) // use .attr() instead of .data()
                           .show();$("#editPhone").show();
	        $("#userPhoneInput").hide();
	        $(this).hide();
	    } else {
	        // If the phone number is invalid, alert the user
	        alert('유효한 번호를 입력해주세요.');
	    }
    });
    
    //총 상품가격 계산 후 표시
    calculateTotalPrice();
	
	//총 상품가격 계산 후 표시
    function calculateTotalPrice() {
        let $totalPriceDisplay = $("#totalPriceDisplay");
        let ticketQuantity = parseInt($totalPriceDisplay.data("ticket-quantity"), 10);
        let ticketPrice = parseFloat($totalPriceDisplay.data("ticket-price"));
        let totalPrice = ticketQuantity * ticketPrice;
        $totalPriceDisplay.text(totalPrice.toLocaleString() + "원"); 
    }   
    
   	//총 결제금액 표시+총금액 변수 초기화  ** 추후 쿠폰 적용 금액 표시 개발 필요
 	let finalPrice = parseFloat($("#totalPriceDisplay").text().replace(/,/g, '').replace('원', ''));
    $("div#finalPriceDisplay").text(finalPrice.toLocaleString() + "원");


	//예매하기 버튼 클릭시 확인 창
	$("button#order").click(function() {
        if (confirm("이대로 예매하시겠습니까?")) {
 
            $("#paymentModal").modal("show");
        }
    });
    
    // 페이먼츠 위젯 초기화
    const paymentWidget = PaymentWidget(
        "test_ck_ALnQvDd2VJ2NP9RnO90aVMj7X41m",PaymentWidget.ANONYMOUS
    );

    // 페이먼스메서드 렌더링 + 총 결제금액 넣기
    paymentWidget.renderPaymentMethods("div#payment-method", { value: finalPrice });

    // 결제하기 클릭시 결제화면으로 
    $("button#payment-request-button").click(function() {
    	
    	// 페이먼스메서드 렌더링 + 총 결제금액 넣기
    	paymentWidget.renderPaymentMethods("div#payment-method", { value: parseFloat($("#finalPriceDisplay").text().replace(/,/g, '').replace('원', '')) });	
		

		// 결재요청
		paymentWidget.requestPayment({
			//예매ID 생성
		    orderId: orderId,
		    //티켓명
		    orderName: $("#productDisplay").text(),
		    //성공시 이동
		    successUrl: window.location.origin + 
		    			"/TicketMvp/reserve/ReserveFinish.do?ticketQuantity=" + $("#ticketQuantity").data("ticket-quantity") 
		    			+ "&ticketId=" + $("#ticketid").val() 
		    			+ "&userId=" + $("#userId").val()
		    			+ "&couponId=" + $("#couponId").val(), 	
		    //실패시 이동
		    failUrl: window.location.origin + "/TicketMvp/reserve/ReserveFinish.do",
		    //고객 이메일 
		    customerEmail: $("div#userEmail").text(),
		    //고객 이름  
		    customerName: $("div#userName").text(),
			//고객 전화번호 
			customerMobilePhone: $("span#userPhone").data("phone")
		});
    });

	//취소 버튼시 뒤로 가기
    $("button#cancel").click(function() {
    	if(confirm("예매 취소하시겠습니까? 확인 클릭시 이전 화면으로 돌아갑니다.")){
    		window.location.href = path+"reserve/ReserveChoose.do?matchid="+matchId;
    	}
    });
    
	//쿠폰창 불러오기
	$(document).on('click', 'button#loadCoupon', function () {
	    $.ajax({
	        type: "GET",
	        url: "/TicketMvp/reserve/ReserveCoupon.do",
	        dataType: "json", 
	        success: function (data) {
				// 불러온 쿠폰정보 입력
	            if (data && data.length > 0) {

	                //쿠폰테이블 생성
	                var couponTable = $('<table class="table table-bordered"></table>');
	                
	                //쿠폰테이블 헤더
                	var tableHeader = '<thead><tr><th>쿠폰번호</th><th>할인율</th><th>발행일</th><th>유통기한</th><th>사용</th></tr></thead>';
                	couponTable.append(tableHeader);
	
					//쿠폰테이블 바디
	                var tableBody = $('<tbody></tbody>');
	                $.each(data, function (index, coupon) {
	                    var row = '<tr>' +
	                        '<td>' + coupon.couponid + '</td>' +
	                        '<td>' + coupon.discount + '%</td>' +
	                       	'<td>' + formatDate(coupon.issuedate) + '</td>' +
        					'<td>' + formatDate(coupon.expiredate) + '</td>' +
        					'<td><button class="btn btn-primary use-coupon" data-coupon-id="' + coupon.couponid + '">사용</button></td>' +
	                        '</tr>';
	                    tableBody.append(row);
	                });
                	couponTable.append(tableBody);

	                // 쿠폰창 비운 후 열기
	                var couponModal = $("#couponModal");
                	couponModal.find(".modal-body").empty().append(couponTable);
	                $("#couponModal").modal("show");
	            } else {
	                // 쿠폰이 없을 경우
	                alert("쿠폰이 없습니다.");
	            };
	        },
	        error: function (xhr, status, error) {
	            console.error("AJAX error:", error);
	            alert("쿠폰을 불러오는데 오류가 났습니다.");
	        }
	    });
	});
    
    //쿠폰창 내 날짜 변환
    function formatDate(dateString) {
    	let date = new Date(dateString);
	    var yyyy = date.getFullYear().toString();
	    var MM = (date.getMonth() + 1).toString().padStart(2, '0');
	    var dd = date.getDate().toString().padStart(2, '0');
	
	    return yyyy + '년 ' + MM + '월 ' + dd + '일';
	};
	
	//쿠폰창에서 쿠폰 하나 클릭하면
	$(document).on('click', '.use-coupon', function () {
        //할인율 받아오기
     	var discountPercentage = parseFloat($(this).closest('tr').find('td:nth-child(2)').text().replace('%', ''));  

        //총 결제금액 계산하기
        var originalPrice = parseFloat($("#totalPriceDisplay").data("ticket-price"));
        var ticketQuantity = parseInt($("#ticketQuantity").data("ticket-quantity"), 10);
        var totalPrice = originalPrice * ticketQuantity;
        var discountAmount = (discountPercentage / 100) * totalPrice;
        var finalPrice = totalPrice - discountAmount;

        //총 결제금액 다시 표기
        $("div#finalPriceDisplay").text(finalPrice.toLocaleString() + "원");

		//쿠폰 값넘기기를 위한 저장
		var couponId = $(this).data('coupon-id')
        $("#couponId").val(couponId);
 
        //쿠폰창 닫기
        $("#couponModal").modal("hide");
        
        //쿠폰 불러오기 버튼을 쿠폰 취소 버튼으로 교체
        $("#loadCoupon").replaceWith('<button id="cancelCoupon" class="btn btn-danger">쿠폰 취소</button>');
	});
 
 	$(document).on('click', '#cancelCoupon', function () {
	    // Remove the selected coupon
	    $("#couponId").val(""); //쿠폰값 초기화
	
	    // 총 결제 금액을 다시 돌려놓기
	    var originalPrice = parseFloat($("#totalPriceDisplay").data("ticket-price"));
	    var ticketQuantity = parseInt($("#ticketQuantity").data("ticket-quantity"), 10);
	    var totalPrice = originalPrice * ticketQuantity;
	    $("div#finalPriceDisplay").text(totalPrice.toLocaleString() + "원");
	
	    // 쿠폰 불러오기 버튼으로 다시 교체
	    $(this).replaceWith('<button id="loadCoupon" class="btn btn-primary">쿠폰 불러오기</button>');
	});
 	
}); //end of document load