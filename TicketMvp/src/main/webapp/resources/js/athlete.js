    // 예매 버튼을 클릭했을 때의 처리
    // athlete.js
    
$(function(){

	//예매 버튼 클릭
    $(".payment-button").on("click", function() {
        console.log("예매 버튼 클릭 성공");

        var matchId = $(this).data("matchid");

        // matchId를 세션에 저장
        sessionStorage.setItem("matchid", matchId);

       // 페이지 이동하면서 matchId를 URL 파라미터로 전송
        window.location.href = "/TicketMvp/reserve/ReserveChoose.do?matchid=" + matchId;
        console.log("성공");
    });
    

 	// 하트 버튼 클릭 이벤트
    $(".bi-heart").on("click", function() {

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
	            console.error("좋아요 목록 불러오는 도중 에러", error);
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


        function checkLikeStatus(matchId) {
		    $.ajax({
		        url: "/TicketMvp/athlete/checkLikeStatus",
		        type: "GET",
		        data: {
		            matchId: matchId
		        },
		        success: function (response) {
		        	console.log("좋아요 상태 확인:", response);
		        	
		        
		            if (response.liked) {
		                // 사용자가 좋아요를 눌렀다면 하트 아이콘을 채워진 상태로 변경
		                $(".bi-heart[data-matchid='" + matchId + "']").addClass("bi-heart-fill");
		            }
		        },
		        error: function (error) {
		            console.error("좋아요 상태 확인 중 오류", error);
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

});






