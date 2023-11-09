$(function() {
    $("button.cancel").click(function() {
		//해당 취소버튼의 열에서 예매id 받아오기
   		let reserveid = $(this).closest("tr").find("input[type='hidden']").val();
   		let totalseat = $(this).closest("tr").find("td:eq(2)").text();
        let ticketname = $(this).closest("tr").find("td:eq(0)").text();
   		let table = $("#tb_orderlist");
       	
       	//예매 취소 전송
       	if (confirm("예매를 취소하시겠습니까?")) {
       		$.ajax({
	            type: "POST",
	            url: "/TicketMvp/user/userMyOrderCancel.do",
	            data: {
                    orderId: reserveid,
                    totalSeat: totalseat,
                    ticketName: ticketname
                },
	            success: function(response) {
	                if (response === "success") {
	                    alert("예매를 취소하셨습니다.");
	                   	$.ajax({
                            type: "GET", 
                            url: "/TicketMvp/user/userMyOrderList.do",
                            dataType: "html",
                            success: function(newTableHTML) {
                                table.html(newTableHTML); 
                            },
                            error: function() {
                                alert("테이블 데이터를 다시 불러오는 도중에 오류가 발생했습니다.");
                            }
                        });
	                } else {
	                    alert("예매 취소 실패했습니다..");
	                }
	            },
	            error: function() {
	                alert("예매 취소 도중에 예상치 못한 오류가 발생하였습니다.");
	            }
	        });
       	}
        
    });
});