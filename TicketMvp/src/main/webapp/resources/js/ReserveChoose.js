$(document).ready(function(){


    //좌석 예매 리스트 active 지정
    $(".list-group-item").click(function(event){
    	$(".hidden-input").removeClass("hidden-input");
    	
        //클릭 된 티켓을 활성화하여 강조
        event.preventDefault()
        $(".list-group-item").removeClass("active");
        $(this).addClass("active");
        
		//수량표시란에서 티켓명표시
    	$("#matchName").text($(this).find("h6").text());
    	$("#ticketQuantity").attr("max", parseInt($(this).find(".ticket-info span:last").text()));
    	$("#ticketQuantity").val(1);
    	
    	
		calculate(parseFloat($(this).find(".ticket-info span").attr("price")),1);
    });
    
    //수량이 바뀌면 총 금액 재계산
    $("#ticketQuantity").on("input", function () {
    	var quantity = parseInt($("#ticketQuantity").val());
    	var maxQuantity = parseInt($("#ticketQuantity").attr("max"));

    	if (quantity >= 0 && quantity <= maxQuantity) {
        	calculate(parseFloat($(".list-group-item.active .ticket-info span").attr("price")), quantity);
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

     // Handle click on the stadium image
    $("#stadium").click(function () {
        var stadiumImageUrl = $(this).attr("src");
        $("#stadiumPopupImage").attr("src", stadiumImageUrl);
        $("#stadiumPopup").fadeIn();
    });

    // Close the pop-up when clicking outside the image
    $("#stadiumPopup").click(function () {
        $(this).fadeOut();
    });

    // Prevent closing the pop-up when clicking on the image itself
    $("#stadiumPopupImage").click(function (e) {
        e.stopPropagation();
    });
});