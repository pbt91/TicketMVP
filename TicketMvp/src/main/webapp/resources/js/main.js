 /*$(document).ready(function() {
            $('.image-item').click(function() {
                var athleteName = $(this).data('athlete-name');
                athleteName = encodeURIComponent(athleteName); // 선수명을 URL로 인코딩

                // 선수 정보 페이지로 이동
                window.location.href = '${pageContext.request.contextPath}/athlete/athlete_information.do?athletename=' + athleteName;
            });
        });
*/        
        
        
        
   $(document).ready(function() {
    // 그리드 전체에 대한 클릭 이벤트
    $('#image-grid-container').click(function(event) {
        // 클릭된 요소가 image-item인 경우에만 동작
        if ($(event.target).hasClass('image-item')) {
            var athleteName = $(event.target).data('athlete-name');
            athleteName = encodeURIComponent(athleteName); // 선수명을 URL로 인코딩

            // 선수 정보 페이지로 이동
            window.location.href = '${pageContext.request.contextPath}/athlete/athlete_information.do?athletename=' + athleteName;
        }
    });
});
        
