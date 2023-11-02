  $(document).ready(function() {
            var numRows = 2; // 그리드의 총 행 수
            var itemsPerRow = 4; // 각 행당 이미지 아이템 수
            var totalItems = numRows * itemsPerRow;

            $(".image-item").each(function(index) {
                var rowNumber = Math.floor(index / itemsPerRow) + 1; // 현재 아이템의 행 번호
                var columnNumber = (index % itemsPerRow) + 1; // 현재 아이템의 열 번호

                // 각 행당 "even" 또는 "odd" 클래스 할당
                if (rowNumber % 2 === 1) { // 홀수 행
                    if (columnNumber % 2 === 1) {
                        $(this).addClass("odd");
                    } else {
                        $(this).addClass("even");
                    }
                } else { // 짝수 행
                    if (columnNumber % 2 === 1) {
                        $(this).addClass("even");
                    } else {
                        $(this).addClass("odd");
                    }
                }
            });
        });