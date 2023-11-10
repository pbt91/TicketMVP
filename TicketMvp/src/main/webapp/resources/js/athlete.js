    // 예매 버튼을 클릭했을 때의 처리
    // athlete.js
    
$(function(){
    $(".payment-button").on("click", function() {
        console.log("예매 버튼 클릭 성공");

        var matchId = $(this).data("matchid");

        console.log("값이 들어가...?")

        // matchId를 세션에 저장
        //sessionStorage.setItem("matchid", matchId);

       // console.log("매치아이디" + matchId);

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
                $(this).removeClass("bi-heart-fill").addClass("bi-heart");
                removeLike(matchId);
            } else {
                // 빈 하트에서 빨간 하트로 변경
                $(this).removeClass("bi-heart").addClass("bi-heart-fill");
                addLike(matchId);
            }
        });

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