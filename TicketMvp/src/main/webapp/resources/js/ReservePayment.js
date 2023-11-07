$(function(){
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

   
   // 예매ID생성을 위한 무작위 String 생성기
    function generateRandomString() {
	    return parseInt(Math.floor(Math.random() * 2147483648).toString().padStart(10, '0'));;
    }

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
		paymentWidget.requestPayment({
			//예매ID 생성
		    orderId: generateRandomString(),
		    //티켓명
		    orderName: $("#productDisplay").text(),
		    //성공시 이동
		    successUrl: window.location.origin + 
		    			"/TicketMvp/reserve/ReserveFinish.do?ticketQuantity=" + $("#ticketQuantity").data("ticket-quantity") 
		    			+ "&ticketId=" + $("#ticketid").val() 
		    			+ "&userId=" + $("#userId").val(), 	
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
    
}); //end of document load