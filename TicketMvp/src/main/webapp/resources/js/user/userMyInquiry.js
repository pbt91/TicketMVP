$(function () {
  
    $('#input').hide();
    $('#view').hide();

    /* 글작성 버튼눌렸을 때 */
    $('#inquiryinsertform').click(function () {
        $("#list").hide();
        //$('#view').hide();
        $('#input').show();
    });

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
    });

    // 글 작성에서 취소눌렀을 때
    $("#inquriylist").click(function () {
        alert('test');
        $("#inputtitle").val("");
        $("#inputproduct").val("");
        $("#inputtext").val("");
        $('#list').show();
        $('#input').hide();
        $('#view').hide();
    });

    // 목록 리스트에서 글 제목 눌렀을때
    $('div.title').click(function () {
        var helpid = $(this).closest(".title").prev(".num").text();
        //alert(helpid);
        $.ajax({
            url: "/TicketMvp/user/userMyInquiryView.do",
            type: "post",
            dataType: "json",
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
                } else {
                    alert("잠시 후 시도해주세요");
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    });

    //글 삭제 
    $('#inquirymydelete').click(function () {
        //글번호
        var helpid = $('#view .info dl dt:contains("번호")').next('dd').text();
        var helpuserid = $('#view .info dl dt:contains("글쓴이")').next('dd').text();
        //alert(helpid);

        // 글번호의 userid 와 세션의 userid 비교후 같으면 삭제 다르면 alert
        $.ajax({
            url: "/TicketMvp/user/userMyInquiryDelete.do",
            type: 'post',
            dataType: 'json',
            data: { "helpid": helpid, "helpuserid": helpuserid },
            success: function (result) {
                if (result) {
                    alert("삭제 되었습니다");
                    location.reload(true);
                } else {
                    alert("해당 글의 작성자만 삭제 할 수 있습니다");
                }
            },
            error: function (err) {
                alert("오류");
            }
        });
    });



    })
    
    $('#inquirylist').click(function(){
    	$('#input').hide();
        $('#list').show();
        $('#view').hide();
    
    
    });



