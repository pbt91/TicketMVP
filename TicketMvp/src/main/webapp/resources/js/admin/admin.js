	$(document).ready(function() {
	    
	    // 티켓 등록 폼 제출 전 필드 유효성 검사
	    function validateTicketForm() {
	        // 필드값을 가져오거나 검사하는 코드
	        var ticketName 	= document.getElementById('ticketname').value;
	        var ticketPrice = document.getElementById('ticketprice').value;
	        var ticketAll 	= document.getElementById('ticketall').value;
	
	        // 필드값이 비어있는 경우 경고 표시 및 폼 제출 방지
	        if (ticketName === '' || ticketPrice === '' || ticketAll === ''  ) {
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
	    
	    
	    // 경기 등록 폼 제출 전 필드 유효성 검사
	    function validateTicketForm() {
	        // 필드값을 가져오거나 검사하는 코드
	        var homeclub 	= document.getElementById('homeclub').value;
	        var awayclub 	= document.getElementById('awayclub').value;
	        var matchdate 	= document.getElementById('matchdate').value;
	        var matchtime 	= document.getElementById('matchtime').value;
	
	        // 필드값이 비어있는 경우 경고 표시 및 폼 제출 방지
	        if (homeclub === '' || awayclub === '' || matchdate === '' || matchtime === '') {
	            alert('경기 정보를 다 입력해주세요.');
	            return false; // 폼 제출을 중지
	        }
	
	        // 필드가 비어있지 않다면 폼을 제출
	        return true;
	    }
	
	    // 폼 제출 버튼 클릭 시 유효성 검사를 수행
	    $('#matchsubmit').on('click', function(event) {
	        if (!validateTicketForm()) {
	            event.preventDefault(); // 폼 제출 방지
	        }
	    });
	
	// 경기 및 티켓 수정 버튼 시 
		$('button#modifyTicketMatch').click(function(){
		    var row = $(this).closest("tr");
		    var ticketid = row.find("td:eq(5)").text();
		    var matchid = row.find("td:eq(6)").text();
		    
		    if(ticketid && ticketid.trim() !== ""){
				console.log(ticketid);    
        		window.location.href = "ticketModify.do?ticketid=" + ticketid;
		    }   
		    else if (matchid && matchid.trim() !== "") {
        		console.log(matchid); 
        		window.location.href = "ticketModify.do?matchid=" + matchid;
    		}
			return false;		
		}) ; 
	    
	    	// 선수 수정 버튼 시 
			$('button#modifyAthlete').click(function(){
		    var athletename = $(this).closest("tr").find("td:eq(0)").text().trim();
		
		    if(athletename && athletename !== ""){
		        console.log(athletename);    
		        window.location.href = "athleteModify.do?athletename=" + athletename;
		    } else {
		        console.log("Athletename not found or empty");
		    }
		    return false;        
		}); 
	    
	    
	    // 구단 수정 버튼 클릭시
			$('button#clubModify').click(function(){
		    var club = $(this).closest("tr").find("td:eq(0)").text().trim();
		
		    if(club && club !== ""){
		        console.log(club);    
		        window.location.href = "clubModify.do?club=" + club;
		    } else {
		        console.log("club not found or empty");
		    }
		    return false;        
		}); 
	    
	    
	    
	    // 선수 등록 폼 제출 전 필드 유효성 검사
	    function validateAthleteForm() {
	        // 필드값을 가져오거나 검사하는 코드
	        var athletename = document.getElementById('athletename').value;
	        var club 		= document.getElementById('club').value;
	        var age 		= document.getElementById('age').value;
	        var position 	= document.getElementById('position').value;
	        var backno 		= document.getElementById('backno').value;
	        var info 		= document.getElementById('info').value;
	        var career 		= document.getElementById('career').value;
	        var athleteImg 	= document.getElementById('athleteImg').value;
	        
	
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
	    

	    // 구단 등록 폼 제출 전 필드 유효성 검사
	    function validateAthleteForm() {
	        // 필드값을 가져오거나 검사하는 코드
	        var clubImg = document.getElementById('clubImg').value;
	        var club = document.getElementById('club').value;
	        var league = document.getElementById('league').value;
	        var stadiumImg = document.getElementById('stadiumImg').value;
	        var stadiumname = document.getElementById('stadiumname').value;

	        
	
	        // 필드값이 비어있는 경우 경고 표시 및 폼 제출 방지
	        if (clubImg === '' || club === '' || league === '' || stadiumImg === '' || stadiumname === '') {
	            alert('모든 정보 및 사진을 입력해주세요.');
	            return false; // 폼 제출을 중지
	        }
	
	        // 필드가 비어있지 않다면 폼을 제출
	        return true;
	    }
	
	    // 폼 제출 버튼 클릭 시 유효성 검사를 수행
	    $('#clubRegi').on('click', function(event) {
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

    if (confirm("선택한 선수를 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: url,
            data: { athletename: athletename },
            dataType: "json", // JSON 데이터 타입으로 요청
            success: function (response) {
                    location.reload();

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

    if (confirm("선택한 유저를 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: url,
            data: { userid: userid },
            dataType: "json", // JSON 데이터 타입으로 요청
            success: function (response) {
                    location.reload();

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

    if (confirm("선택한 경기를 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: url,
            data: { matchid: matchid },
            dataType: "json", // JSON 데이터 타입으로 요청
            success: function (response) {
                    location.reload();
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

    if (confirm("선택한 클럽을 삭제하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: url,
            data: { clubname: clubname },
            dataType: "json", // JSON 데이터 타입으로 요청
            success: function (response) {
                    location.reload();

            },
            error: function(err) {
                alert("경기 및 선수 먼저 삭제해주세요.");
                console.log(err);
            }
        });
    }
});

// 차트 관련
   google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawVisualization);

    function drawVisualization() {
        // Ajax를 사용하여 서버에서 데이터 가져오기
        $.ajax({
            url: "chartTicketClubData.do",
            type: "GET",
            dataType: "json",
            success: function(data) {
            	console.log('-----------------');
            	console.log(data);
                // 데이터를 받아와서 차트를 그리는 로직 호출
                //drawChartFromData(data);
            },
            error: function(error) {
                console.log(error);
            }
        });
    }

function drawChartFromData(data) {
    var chartData = [['선수명', '티켓명', '티켓남은수량']];

    for (var i = 0; i < data.length; i++) {
        chartData.push([
            data[i].athletename,
            data[i].ticketname,
            data[i].ticketremain
        ]);
    }

    var options = {
        title: '선수별 티켓 판매량',
        vAxis: { title: '티켓 판매량' },
        hAxis: { title: '선수명' },
        seriesType: 'bars',
        series: { 1: { type: 'line' } }
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(google.visualization.arrayToDataTable(chartData), options);
}



	});