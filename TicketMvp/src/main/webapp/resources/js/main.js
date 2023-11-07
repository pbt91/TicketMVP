 $(document).ready(function() {
            $('.image-item').click(function() {
                var athleteName = $(this).data('athlete-name');
                athleteName = encodeURIComponent(athleteName); // 선수명을 URL로 인코딩

                // 선수 정보 페이지로 이동
                window.location.href = '${pageContext.request.contextPath}/athlete/athlete_information.do?athletename=' + athleteName;
            });
        });
