$(function () {
	loadPage(1);
	
    $('#input').hide();
    $('#view').hide();

    /* 글작성 버튼눌렸을 때 */
    $('#inquiryinsertform').click(function () {
        $("#list").hide();
        //$('#view').hide();
        $('#input').show();

    })

    /* 글 작성하고 등록버튼 눌렀을 때 */
    $('#inquiryinsert').click(function () {

        var title = $("#inputtitle").val();
        var product = $("#inputproduct").val();
        var text = $("#inputtext").val();

        if (title == "" || text == "") {
            alert("제목과 내용은 필수로 입력해주세요");
            return false;
        }

        //alert(title+"/"+product+"/"+text);

        $.ajax({
            url: "/TicketMvp/user/userMyInquiryInsert.do",
            type: "post",
            dataType: "json",
            data: {
                "helptitle": title,
                "helptext": text,
                "helpproduct": product
            },
            success: function (result) {
                if (result == 1) {
                    alert("등록이 완료되었습니다");
                    $("#inputtitle").val("");
                    $("#inputproduct").val("");
                    $("#inputtext").val("");
                    //$('#input').hide();
                    //$('#list').show();      /* 일단 리스트 화면 보여줌 */
                    location.reload(true);

                } else {
                    alert("잠시 후 시도해주세요");
                }
            },
            error: function (err) {
                alert("오류");
            }

        });

        //location.reload(true);

    })
    
    // 글 작성에서 취소눌렀을 때
    $("#inquriylist").click(function(){
    	$("#inputtitle").val("");
        $("#inputproduct").val("");
        $("#inputtext").val("");
    	$('#list').show();
    	$('#input').hide();
    	$('#view').hide();
    })

    // 목록 리스트에서 글 제목 눌렀을때
    $('div.title').click(function () {
        var helpid = $(this).closest(".title").prev(".num").text();
        //alert(helpid);
        $.ajax({
            url: "/TicketMvp/user/userMyInquiryView.do",
            type: "post",
            dataType : "json",
            data: ({ "helpid": helpid }),
            success: function (result) {
                //alert("controller갔다옴");
                if (result != null) {
                   // alert("값이 널이 아님");
                    $('#input').hide();
                    $('#list').hide();
                    //alert(result.helptitle);
					
                    $("#view .board_view .title").text(result.helptitle);
                    $("#view .board_view .info dd:eq(0)").text(result.helpid);
                    $("#view .board_view .info dd:eq(1)").text(result.userid);
                    $("#view .board_view .info dd:eq(2)").text(result.helpdate);
                    $("#view .board_view .info dd:eq(3)").text(result.helpproduct);
                    $("#view .board_view .info dd:eq(4)").text(result.replydate);
                    $("#view .board_view .cont").text(result.helptext);
                    $("#view .board_view .reply").text(result.replytext);

                    $('#view').show();
                } else {d
                    alert("잠시 후 시도해주세요");
                }
            },
            error: function (err) {
                
                console.log(err);
            }

        });

    });
    
    //글 삭제 
    $('#inquirymydelete').click(function(){
        //글번호
        var helpid = $('#view .info dl dt:contains("번호")').next('dd').text(); 
        var helpuserid = $('#view .info dl dt:contains("글쓴이")').next('dd').text(); 
        //alert(helpid);

        // 글번호의 userid 와 세션의 userid 비교후 같으면 삭제 다르면 alert
        $.ajax({
            url : "/TicketMvp/user/userMyInquiryDelete.do",
            type : 'post',
            dataType : 'json',
            data : { "helpid" : helpid,
                     "helpuserid" : helpuserid},
            success : function (result) {
                if(result){
                    alert("삭제 되었습니다");
                    location.reload(true);
                }else{
                    alert("해당 글의 작성자만 삭제 할 수 있습니다");
                }
            },
            error : function(err){
                alert("오류");
            }

        })
    
    });
    
    // 페이지 번호 클릭 시 페이지 이동
	$(document).on('click', '.board_page .num', function() {
	    var selectedPage = $(this).text();
	    loadPage(selectedPage);
	});
    
    //페이지 번호 적용 method
    function loadPage(pageNumber) {
	    $.ajax({
	        url: "/TicketMvp/user/userInquiryPage.do",
	        type: "GET",
	        data: {
	            page: pageNumber,
	            size: 20 
	        },
	        dataType:'json',
	        success: function(response) {     
				console.log(response);

	            // Extract data from the JSON response
	            var inquiries = response.inquiries;
	            var currentPage = response.currentPage;
	            var totalPages = response.totalPages;
	
	            // Update the inquiry list in the HTML
	            var boardList = $(".board_list");
	            boardList.empty();
	
	            if (inquiries != null && inquiries.length > 0) {
	                $.each(inquiries, function (index, inquiry) {
	                    var replyStatus = inquiry.replydate ? "완료" : "대기";
	                    var inquiryItem = `
	                        <div>
	                            <div class="num">${inquiry.helpid}</div>
	                            <div class="title">
	                                <a href="javascript:loadInquiry(${inquiry.helpid})">${inquiry.helptitle}</a>
	                            </div>
	                            <div class="writer">${inquiry.userid}</div>
	                            <div class="date">${inquiry.helpdate}</div>
	                            <div class="reply">${replyStatus}</div>
	                        </div>
	                    `;
	                    boardList.append(inquiryItem);
	                });
	            } else {
	                boardList.append('<span class="tb-center" style="font-size: 20px; position: absolute;">아직 작성된 글이 없습니다</span>');
	            }
	
	            // Update the pagination links
	            var boardPage = $(".board_page");
	            boardPage.empty();
	
	            if (currentPage != 1) {
	                boardPage.append(`<a href="javascript:loadPage(${currentPage - 1})" class="bt prev">&lt;</a>`);
	            }
	
	            for (var i = 1; i <= totalPages; i++) {
	                var activeClass = currentPage == i ? 'on' : '';
	                boardPage.append(`<a href="javascript:loadPage(${i})" class="num ${activeClass}">${i}</a>`);
	            }
	
	            if (currentPage != totalPages) {
	                boardPage.append(`<a href="javascript:loadPage(${currentPage + 1})" class="bt next">&gt;</a>`);
	            }
	        },
	        error: function(error) {
	            console.error("Error during AJAX call: ", error);
	        }
	    });
	}
})

