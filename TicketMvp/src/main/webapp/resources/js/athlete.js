//athlete.js

$(document).ready(function() {
    $('.image-item').click(function() {
        var athleteName = $(this).data('athlete-name');
        athleteName = encodeURIComponent(athleteName); // 선수명을 URL로 인코딩

        // 선수 정보를 불러오는 AJAX 요청
        $.ajax({
            type: "GET",
            url: '${pageContext.request.contextPath}/athlete/athlete_information.do?athletename=' + athleteName,
            dataType: "html", // HTML 형식으로 데이터를 받음
            success: function(data) {
                // 변경된 부분: 선수 정보 페이지로 교체
                $('#content').html(data);
            },
            error: function() {
                // 필요한 경우 오류 처리
                console.error('선수 정보를 불러오는 데 실패했습니다.');
            }
        });
    });
});
