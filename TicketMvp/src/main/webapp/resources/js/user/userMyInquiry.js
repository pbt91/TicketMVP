$(function(){
    /*if($('#input').show()==ture){
        //이 페이지에서 뒤로가기 하거나, 새로고침을 할 때 이벤트 발생
        window.onbeforeunload = function(){
            return '페이지를 벗어나시겠습니까?';
        }
    } */

    $('#input').hide();
    
    /* 글작성 버튼눌렸을 때 */
    $('#inquiryinsertform').click(function(){
        $("#list").hide();
        $('#input').show();
    })

    /* 글 작성하고 등록버튼 눌렀을 때 */
    $('#inquiryinsert').click(function(){

        var title = $("#inputtitle").val();
        var product = $("#inputproduct").val();
        var text = $("#inputtext").val();
        
        if(title=="" || text==""){
            alert("제목과 내용은 필수로 입력해주세요");
            return false;
        }

        //alert(title+"/"+product+"/"+text);

        $.ajax({
            url : "/TicketMvp/user/userMyInquiryInsert.do",
            type : "post",
            dataType : "json",
            data : {    "helptitle"     : title,
                        "helptext"      : text,
                        "helpproduct"   : product
            },
            success : function(result){
                if(result==1){
                    alert("등록이 완료되었습니다");
                    $("#inputtitle").val("");
                    $("#inputproduct").val("");
                    $("#inputtext").val("");
                    //$('#input').hide();
                    //$('#list').show();      /* 일단 리스트 화면 보여줌 */
					location.reload(true);		
                    
                }else{
                    alert("잠시 후 시도해주세요");
                }  
            },
            error : function(err){
                alert("오류");
            }
              
        });

        //location.reload(true);

    })

//    $('a.title').click(function(){
//        $(this)
//    });


})