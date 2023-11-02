// 비밀번호 찾기 폼
$(function(){
    
    var userinputuserid = $('#userid').val();
    var userinputemail = $('#email').val();
    
    // 아이디,이메일 입력 후 확인버튼 눌렀을 때
    $('#find_pw').click(function(){
    
        $.ajax({
            url : '/TicketMvp/user/findPw',                  	/* 요청보낼 controller의 주소 */
            type : 'post',
            data : {"userid" : userinputuserid,
            		"email" : userinputemail },
            success : function (findpassResult){   
                // 아이디,이메일 매칭 실패 시
                if(findpassResult==null){
                    // 이메일 입력칸 초기화
                    $('#userid').text("");
                    $('#email').text("");
                    alert("메일주소 또는 아이디가 잘못되었습니다");
                // 아이디,이메일 매칭 성공 시
                }else{
                    //넘어온 값 보여주기
                    $('#temppw').attr('disabled', false);
                   alert("입력하신 메일에서 인증키를 확인해주세요");
                }
            },
            error : function(err){
            	console.log(err);
                alert("오류")
            }
        });

    });
    
    $('#checkTempPw').click(function(){
    	var userinputtemppw = $('#temppw').val();
    	
    	$.ajax({
    		url : '/T'
    	
    	})
    
    
    
    });	// end of click

})