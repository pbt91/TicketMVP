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
	            alert('티켓 정보를 입력해주세요.');
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
	    
	    // 선수 등록 폼 제출 전 필드 유효성 검사
	    function validateAthleteForm() {
	        // 필드값을 가져오거나 검사하는 코드
	        var athletename = document.getElementById('athletename').value;
	        var club = document.getElementById('club').value;
	        var age = document.getElementById('age').value;
	        var position = document.getElementById('position').value;
	        var backno = document.getElementById('backno').value;
	        var info = document.getElementById('info').value;
	        var career = document.getElementById('career').value;
	        var athleteImg = document.getElementById('athleteImg').value;
	        
	
	        // 필드값이 비어있는 경우 경고 표시 및 폼 제출 방지
	        if (athletename === '' || club === '' || age === '' || position === '' || backno === '' || info === '' || career === '' || athleteImg === '' ) {
	            alert('모든 정보 및 사진을 입력해주세요.');
	            return false; // 폼 제출을 중지
	        }
	
	        // 필드가 비어있지 않다면 폼을 제출
	        return true;
	    }
	
	    // 폼 제출 버튼 클릭 시 유효성 검사를 수행
	    $('#athleteRegi').on('click', function(event) {
	        if (!validateAthleteForm()) {
	            event.preventDefault(); // 폼 제출 방지
	        }
	    });
	    



 // 티켓 삭제
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


// 선수 삭제 버튼 클릭시	
$('button#deleteAthlete').click(function() {
    var athletename = $(this).closest('tr').find('a').attr('href').split('=')[1];
    var url = "deleteAthletename.do"; // Spring 컨트롤러의 URL 경로

    if (confirm("선택한 티켓을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: url,
            data: { athletename: athletename },
            dataType: "json", // JSON 데이터 타입으로 요청
            success: function (response) {
                if (response.result === "success") {
                    location.reload();
                } else {
                 location.reload();
                    alert("삭제에 실패했습니다.");
                }
            },
            error: function(err) {
                alert("오류가 발생했습니다.");
                console.log(err);
            }
        });
    }
});

// 유저 삭제 버튼 시
$('button#deleteUser').click(function() {
    var userid = $(this).closest('tr').find('td:first').text();
    var url = "deleteUserid.do"; // Spring 컨트롤러의 URL 경로

    if (confirm("선택한 티켓을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: url,
            data: { userid: userid },
            dataType: "json", // JSON 데이터 타입으로 요청
            success: function (response) {
                if (response.result === "success") {
                    location.reload();
                } else {
                 location.reload();
                    alert("삭제에 실패했습니다.");
                }
            },
            error: function(err) {
                alert("오류가 발생했습니다.");
                console.log(err);
            }
        });
    }
});

// 경기 삭제 버튼 시
$('button#deleteMatch').click(function() {
    var matchid = $(this).closest('tr').find('td:nth-child(7)').text(); // 7번째 열은 경기 번호
    var url = "deleteMatch.do"; // Spring 컨트롤러의 URL 경로

    if (confirm("선택한 티켓을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: url,
            data: { matchid: matchid },
            dataType: "json", // JSON 데이터 타입으로 요청
            success: function (response) {
                if (response.result === "success") {
                    location.reload();
                } else {
                location.reload();
                    alert("삭제에 실패했습니다.");
                }
            },
            error: function(err) {
                alert("티켓 먼저 삭제해주세요.");
                console.log(err);
            }
        });
    }
});



// 클럽 삭제 버튼 클리시
$('button#deleteClub').click(function() {
    var clubname = $(this).closest('tr').find('a').attr('href').split('=')[1];
    var url = "deleteClubname.do"; // Spring 컨트롤러의 URL 경로

    if (confirm("선택한 티켓을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: url,
            data: { clubname: clubname },
            dataType: "json", // JSON 데이터 타입으로 요청
            success: function (response) {
                if (response.result === "success") {
                    location.reload();
                } else {
                    alert("삭제에 실패했습니다.");
                }
            },
            error: function(err) {
                alert("경기 먼저 삭제해주세요.");
                console.log(err);
            }
        });
    }
});



	});