 $(document).ready(function(){

	//좌석 예매 리스트 active 지정
	$(".list-group-item").click(function(){
		//클릭 된 티켓을 활성화하여 강조
		event.preventDefault()
		$(".list-group-item").removeClass("active");
		$(this).addClass("active");
		
	});
    
});