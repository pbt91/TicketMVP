$(function(){
    //좌석 예매 리스트 active 지정
    $(".list-group-item").click(function(event){
        $(".hidden-input").removeClass("hidden-input");

        // 예매페이지에 넘길 티켓id hidden input에 값 넣기
        $("input#ticketId").val($(this).data("ticketid"));
        $("input#ticketQuantityBuy").val($("#ticketQuantity").val());

        // 클릭된 티켓을 활성화하여 강조
        event.preventDefault();
        $(".list-group-item").removeClass("active");
        $(this).addClass("active");

        // 수량표시란에서 티켓명 표시
        $("#matchName").text($(this).find("h6").text());
        $("#ticketQuantity").attr("max", parseInt($(this).find(".ticket-info span:last").text()));
        $("#ticketQuantity").val(1);
        calculate(parseFloat($(this).find(".ticket-info span").attr("price")), 1);
    });
        
    //수량이 바뀌면 총 금액 재계산
    $("#ticketQuantity").on("input", function () {
    	var quantity = parseInt($("#ticketQuantity").val());
    	var maxQuantity = parseInt($("#ticketQuantity").attr("max"));

    	if (quantity >= 0 && quantity <= maxQuantity) {
        	calculate(parseFloat($(".list-group-item.active .ticket-info span").attr("price")), quantity);
        	$("input#ticketQuantityBuy").val($("#ticketQuantity").val());
    	} else if ( quantity > maxQuantity) {
    		alert("최대 예매 가능 수량을 입력하셨습니다. 다시 입력해주세요")
    		$("#ticketQuantity").val(1);
    		calculate(parseFloat($(".list-group-item.active .ticket-info span").attr("price")), 1);
    	} else {
    		$("#ticketQuantity").val(0);
    		calculate(parseFloat($(".list-group-item.active .ticket-info span").attr("price")), 0);
    	}
	});
    
    //총 금액 계산 후 표시
    function calculate(ticketPrice, quantity) {
    	$("#totalAmount").text((quantity * ticketPrice).toLocaleString());
	}	
	 
	//예매버튼 클릭에 넘어가기 전 확인 메시지
	$("button#purchase").click(function(event){ 
		event.preventDefault(); 

		//로그인 되어 있으면 예매 불가
 		if ($("#userLoggedIn").val() === 'false') {
            alert("로그인을 해야 예매하실 수 있습니다. 로그인 해주세요.");
            window.location.href = "/TicketMvp/user/userLoginForm.do";
            return; 
        }
		

	    // 티켓이 선택 되어있는지 확인
	    let ticketId = $("#ticketId").val();
	    if (!ticketId || ticketId.trim() === "") {
	        alert("티켓을 선택해주세요.");
	    } else {	
	        // 예약확인 팝업창 열기 실행
			updateReservationInfo();
	        $("#reservationInfoModal").modal("show");
    	}
	});

    // 경기장 이미지 클릭 하면 팝업
	$("#stadium").click(function () {
		let stadiumImageUrl = $(this).attr("src");
		$("#stadiumPopupImage").attr("src", stadiumImageUrl);
		$("#stadiumPopup").fadeIn();
	});
	
    // 팝업 이미지 외부 영역 클릭 하면 닫기
    $("#stadiumPopup").click(function () {
        $(this).fadeOut();
    });
    // 팝업 이미지 자체를 클릭할 시 닫기 멈추기
    $("#stadiumPopupImage").click(function (e) {
        e.stopPropagation();
    });
	    
	
	// 예매확인 페이지에 정보 입력
    function updateReservationInfo() {	    
        $("#reservationStadium").text($("#stadiumName").text());
        $("#reservationDate").text($("#matchDay").text());
        $("#reservationTime").text($("#matchTime").text());
        $("#reservationSeat").text($("#matchName").text());
        $("#reservationQuantity").text($("#ticketQuantity").val());
        $("#reservationTotal").text($("#totalAmount").text());
    }
}); ///end of document load