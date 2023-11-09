	$(document).ready(function() {
	    
	    // 티켓 등록 폼 제출 전 필드 유효성 검사
	    function validateTicketForm() {
	        // 필드값을 가져오거나 검사하는 코드
	        var ticketName = document.getElementById('ticketname').value;
	        var ticketPrice = document.getElementById('ticketprice').value;
	        var ticketAll = document.getElementById('ticketall').value;
	        var ticketRemain = document.getElementById('ticketremain').value;
	
	        // 필드값이 비어있는 경우 경고 표시 및 폼 제출 방지
	        if (ticketName === '' || ticketPrice === '' || ticketAll === '' || ticketRemain === '') {
	            alert('모든 필수 필드를 입력해주세요.');
	            return false; // 폼 제출을 중지
	        }
	
	        // 필드가 비어있지 않다면 폼을 제출
	        return true;
	    }
	
	    // 폼 제출 버튼 클릭 시 유효성 검사를 수행
	    $('#ticketsubmit').on('click', function(event) {
	        if (!validateTicketForm()) {
	            event.preventDefault(); // 폼 제출 방지
	        }
	    });
	    

 
$('button#deleteTicket').click(function() {
    var ticketId = $(this).closest('tr').find('a').attr('href').split('=')[1];
    var url = "deleteTicket.do"; // Spring 컨트롤러의 URL 경로
    console.log(ticketId);
    console.log(url);
    
    
    if (confirm("선택한 티켓을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST", // POST 요청
            url: url,
            data: { ticketId: ticketId }, // 요청 매개변수로 ticketId를 전달
            success: function (response) {
                location.reload(); 
            },
            error: function(err) {
                alert('err');
                console.log(err);
            }
        });
    }
});

	});
	
$('button#deleteAthlete').click(function() {
    var athletename = $(this).closest('tr').find('a').attr('href').split('=')[1];
    var url = "deleteAthletename.do"; // Spring 컨트롤러의 URL 경로
    console.log(athletename);
    console.log(url);
    
    
    if (confirm("선택한 티켓을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST", // POST 요청
            url: url,
            data: { athletename: athletename }, // 요청 매개변수로 athletename를 전달
            success: function (response) {
                location.reload(); 
            },
            error: function(err) {
                alert('err');
                console.log(err);
            }
        });
    }


	});

