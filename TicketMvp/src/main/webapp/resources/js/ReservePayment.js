$(document).ready(function(){
    //총 상품가격 계산 후 표시
    calculateTotalPrice();

	//총 결제금액 표시    ***쿠폰 적용시추후 변경 필요***
	$("#finalPriceDisplay").text($("#totalPriceDisplay").text());
	
	//총 상품가격 계산 후 표시
    function calculateTotalPrice() {
        var $totalPriceDisplay = $("#totalPriceDisplay");
        var ticketQuantity = parseInt($totalPriceDisplay.data("ticket-quantity"), 10);
        var ticketPrice = parseFloat($totalPriceDisplay.data("ticket-price"));
        var totalPrice = ticketQuantity * ticketPrice;
        $totalPriceDisplay.text(totalPrice.toLocaleString() + "원"); 
    }
}); //end of document load