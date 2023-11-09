    // 예매 버튼을 클릭했을 때의 처리
    // athlete.js
    
$(function(){
    $(".payment-button").on("click", function() {
        console.log("예매 버튼 클릭 성공");

        var matchId = $(this).data("matchid");

        console.log("값이 들어가...?")

        // matchId를 세션에 저장
        sessionStorage.setItem("selectedMatchId", matchId);

        console.log("매치아이디" + matchId);

        // 페이지 이동하면서 matchId를 URL 파라미터로 전송
        window.location.href = "/TicketMvp/athlete/ReserveChoose.do?matchId=" + matchId;
        console.log("성공");
    });
    
    
    //하트 버튼 클릭 이벤트
   $(".heart-button").on("click", function(){
        console.log("하트 버튼 클릭 성공");

        var matchId = $(this).data("matchid");

        // 하트 상태 확인
        var isFilled = $(this).html() === "&#x2665;";

        if (isFilled) {
            // 빨간 하트에서 빈 하트로 변경
            $(this).html("&#x2661;");
            // TODO: 빨간 하트에서 빈 하트로 변경 시 찜 테이블에서 해당 데이터 삭제하는 로직 추가
            removeLike(matchId);
        } else {
            // 빈 하트에서 빨간 하트로 변경
            $(this).html("&#x2665;");
            // TODO: 빈 하트에서 빨간 하트로 변경 시 찜 테이블에 데이터 삽입하는 로직 추가
            addLike(matchId);
        }
    });

    // 찜 추가하는 함수
    function addLike(matchId) {
        // 현재 로그인한 사용자의 id 가져오기
        var userId = "${userId}"; // 여기에는 현재 로그인한 사용자의 id를 가져오는 방법을 넣어주세요.

        // Ajax 요청으로 찜 추가
        $.ajax({
            url: "/TicketMvp/athlete/addLike",
            type: "POST",
            data: {
                userId: userId,
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
        // 현재 로그인한 사용자의 id 가져오기
        var userId = "${userId}"; // 여기에는 현재 로그인한 사용자의 id를 가져오는 방법을 넣어주세요.

        // Ajax 요청으로 찜 삭제
        $.ajax({
            url: "/TicketMvp/athlete/removeLike",
            type: "POST",
            data: {
                userId: userId,
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