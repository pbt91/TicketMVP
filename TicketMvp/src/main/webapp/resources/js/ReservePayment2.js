$(function(){
	//path에 프로젝트명 넣기
    let path = "/TicketMvp/";
	
	//경기Id 가져오기
	let matchId = $("input#matchid").val();
    
    //전화번호 포멧 함수
    function formatPhoneNumber(phoneNumber) {
	    // 전화번호 11자리이면
	    if (phoneNumber && phoneNumber.length === 11) {
	        return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
	    } 
	    // 전화번호 10자리이면
	    else if (phoneNumber && phoneNumber.length === 10){
	        return phoneNumber.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");;
   		} else {
   			return phoneNumber;
   		}
	}
    
    // 전화번호 포멧 후 다시 표기  
    var currentPhoneNumber = $("span#userPhone").text().trim();
    $("span#userPhone").text(formatPhoneNumber(currentPhoneNumber));
    
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

    //예매 확인 메시지
    $("#order").click(function() {
        // 예매 확인 클릭시
        if (confirm("이대로 예매하시겠습니까?")) {
        	//토스 결제창 팝업
            $("#paymentModal").modal("show");
        } 
    });
        
    //취소 버튼시 뒤로 가기
    $("button#cancel").click(function() {
    	if(confirm("예매 취소하시겠습니까? 확인 클릭시 이전 화면으로 돌아갑니다.")){
    		window.location.href = path+"reserve/ReserveChoose.do?matchid="+matchId;
    	}
    });
    
    // 예매ID생성을 위한 무작위 String 생성기
    function generateRandomString() {
	    return parseInt(Math.floor(Math.random() * 2147483648).toString().padStart(10, '0'));;
    }

    // 페이먼츠 위젯 초기화
    const paymentWidget = PaymentWidget(
        "test_ck_ALnQvDd2VJ2NP9RnO90aVMj7X41m",
        PaymentWidget.ANONYMOUS
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
            successUrl: window.location.origin + path 
            	+ "reserve/ReserveFinish.do?ticketQuantity="+$("#ticketQuantity").data("ticket-quantity")
            	+ "&ticketId="+$("input#ticketid").val()
            	+ "&userId="+$("input#userId").val(), 	
            //실패시 이동
            failUrl: window.location.origin + path + "error/billingFail.do",
            //고객 이메일 
            customerEmail: $("div#userEmail").text(),
            //고객 이름  
            customerName: $("div#userName").text(),
			//고객 전화번호 
			customerMobilePhone: $("span#userPhone").data("phone")
        });
    }); 
   
}); //end of document load