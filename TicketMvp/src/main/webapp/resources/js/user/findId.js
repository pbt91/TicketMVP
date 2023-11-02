// 아이디찾기 폼
$(function(){
    // 이메일 입력 후 확인버튼 눌렀을 때
    $('#find_id').click(function(){
        // 사용자가 입력한 이메일
        var userinputemail = $('#email').val();
		console.log(userinputemail);
        $.ajax({
            url : '/TicketMvp/user/findId',                  	/* 요청보낼 controller의 주소 */
            type : 'post',                                      /* get인지 post인지 */
            data : { "email" : userinputemail },                /* 이메일이란 이름으로 사용자가 입력한 이메일 보냄 */    
            success : function (findIdResult){   
                // 넘어온 값이 null 즉 가입된 이메일이 없으면
                if(findIdResult==null){
                    // 이메일 입력칸 초기화
                    $('#email').text("");
                // 넘어온 값이 있으면 즉 확인된 이메일이 있으면
                }else{
                    //넘어온 값 보여주기
                    $('#findIdResult').text(findIdResult);
                }
            },
            error : function(err){
                alert("오류")
            }
        });

    });

})