$(function(){
	//날짜 변수
	var fromInput = $("#from");
    var toInput = $("#to");

	//예매 버튼 클릭
	$(".payment-button").on("click", function() {
        console.log("예매 버튼 클릭 성공");

        var matchId = $(this).data("matchid");

        console.log("값이 들어가...?")

        // matchId를 세션에 저장
        sessionStorage.setItem("selectedMatchId", matchId);


        // 페이지 이동하면서 matchId를 URL 파라미터로 전송
        window.location.href = "/TicketMvp/reserve/ReserveChoose.do?matchid=" + matchId;
        console.log("성공");
    });
    
    
    // 하트 버튼 클릭 이벤트
    $(".bi-heart").on("click", function () {
       
        var matchId = $(this).data("matchid");
        var isFilled = $(this).hasClass("bi-heart-fill");

        if (isFilled) {
            // 빨간 하트에서 빈 하트로 변경
            removeLike(matchId);
        } else {
            // 빈 하트에서 빨간 하트로 변경
            addLike(matchId);
        }
        
        $(this).toggleClass("bi-heart-fill bi-heart");
    });

	// 페이지 로딩 시 사용자가 좋아요를 눌렀는지 확인하고 하트 아이콘을 업데이트
	$(document).ready(function () {
		checkLikeStatus();
	});

	//찜 목록 갱신 method
    function checkLikeStatus() {
	    $.ajax({
	        url: "/TicketMvp/athlete/checkLikeStatus",
	        type: "GET",
	        dataType: "json",
	        success: function(likedMatchIds) {
	            console.log("Response from checkLikeStatus:", likedMatchIds);
	            if (Array.isArray(likedMatchIds)) {
	                $(".bi-heart").each(function() {
	                    var matchId = parseInt($(this).data("matchid"));
	                    if (likedMatchIds.includes(matchId)) {
	                        $(this).addClass("bi-heart-fill").removeClass("bi-heart");
	                    } else {
	                        $(this).addClass("bi-heart").removeClass("bi-heart-fill");
	                    }
	                });
	            }
	        },
	        error: function(error) {
	            console.error("Error checking like status", error);
	        }
	    });
	}

    // 찜 추가하는 함수
    function addLike(matchId) {
        $.ajax({
            url: "/TicketMvp/athlete/addLike",
            type: "POST",
            data: {
                matchId: matchId
            },
            success: function(response) {
                console.log("찜 추가 성공");
            },
            error: function(error) {
                console.error("찜 추가 실패", error);
            }
        });
    }

    // 찜 삭제하는 함수
    function removeLike(matchId) {
        $.ajax({
            url: "/TicketMvp/athlete/removeLike",
            type: "POST",
            data: {
                matchId: matchId
            },
            success: function(response) {
                console.log("찜 삭제 성공");
            },
            error: function(error) {
                console.error("찜 삭제 실패", error);
            }
        });
    }
		
	// 클럽 필터 이벤트 컨트롤러
    $(".clubFilterCheckbox, .stadiumFilterCheckbox").on("change", function () {
        filterMatches();
    });


	// 경기 필터 후 다시 경기 리스트 보여주기
    function filterMatches() {
	    // 구단명 가져오기
	    var selectedClubs = $(".clubFilterCheckbox:checked").map(function () {
	        return $(this).val();
	    }).get();
	
	    // 경기장명 가져오기
	    var selectedStadiums = $(".stadiumFilterCheckbox:checked").map(function () {
	        return $(this).val();
	    }).get();
	
	    // 날짜 가져오기
	    var fromDate = fromInput.val();
	    var toDate = toInput.val();
	
	    // 가져온 정보로 경기 필터
	    $("#matches-container .gird-item").each(function () {
	        var match = $(this);
	        var homeClub = match.data("homeclub");
	        var awayClub = match.data("awayclub");
	        var stadium = match.data("stadiumname");
	        var matchDate = match.data("matchdate");
	
	        var showMatch =
	            (!selectedClubs.length || selectedClubs.includes(homeClub) || selectedClubs.includes(awayClub)) &&
	            (!selectedStadiums.length || selectedStadiums.includes(stadium));
	
	        // Check if the match date is within the selected date range
	        if (fromDate && toDate) {
	            var selectedFromDate = new Date(fromDate);
	            var selectedToDate = new Date(toDate);
	            var matchDateObj = new Date(matchDate);
	
	            if (matchDateObj >= selectedFromDate && matchDateObj <= selectedToDate) {
	                showMatch = showMatch && true;
	            } else {
	                showMatch = false;
	            }
	        }
	
	        match.toggle(showMatch);
	    });
	}


	// 날짜 선택 숨기기
    function toggleDateInputs() {
        const dateInputs = $('#dateInputs');
        dateInputs.toggle(); // Toggle visibility
    }

    // 날짜 필터 버튼 이벤트 리스너
    $(document).ready(function () {
        const dateFilterButton = $('#dateFilterButton');
        dateFilterButton.click(toggleDateInputs);
    });
    
    // 날짜 선택
    $('.datepick').on('change', function () {
	    var selectedDate = $(this).val();
	
	    var selectedDateObj = new Date(selectedDate);
	    var today = new Date();
	
	    if (this === fromInput[0]) {
	        toInput.attr('min', selectedDate);
	
	        var toDate = new Date(toInput.val());
	        if (toDate < selectedDateObj) {
	            toInput.val(selectedDate);
	        }
	    } else if (this === toInput[0]) {
	        fromInput.attr('max', selectedDate);
	
	        var fromDate = new Date(fromInput.val());
	        if (fromDate > selectedDateObj) {
	            fromInput.val(selectedDate);
	        }
	    }
	
	    // Prevent selection of dates behind today
	    if (selectedDateObj < today) {
	        if (this === fromInput[0]) {
	            fromInput.val(today.toISOString().split('T')[0]);
	        } else if (this === toInput[0]) {
	            toInput.val(today.toISOString().split('T')[0]);
	        }
	    }
	
	    // Call the filterMatches function to update matches based on the selected date range
	    filterMatches();
	});
    
  	// 필터 기능 초기화
    filterMatches();

});