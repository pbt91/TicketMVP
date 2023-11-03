// 비밀번호 찾기 폼
$(function(){
    

    
    // 아이디,이메일 입력 후 확인버튼 눌렀을 때
    $('#find_pw').click(function(){
        var userinputuserid = $('#userid').val();
    	var userinputemail = $('#email').val();
        $.ajax({
            url : '/TicketMvp/user/findPw',                  	/* 요청보낼 controller의 주소 */
            type : 'post',
            data : {"userid" : userinputuserid,
            		"email" : userinputemail },
            success : function (result){   
                // 아이디,이메일 매칭 실패 시
                if(result==null){
                    // 이메일 입력칸 초기화
                    $('#userid').text("");
                    $('#email').text("");
                    alert("메일주소 또는 아이디가 잘못되었습니다");
                // 아이디,이메일 매칭 성공 시
                }else{
                    // 넘어온 값이 정상이면
                    $('#temppw').attr('disabled', false);
                   alert("입력하신 메일에서 인증키를 확인해주세요");
                }
            },
            error : function(err){
            	console.log(err);
                alert("오류");
            }
        });

    });
    
    // 비밀번호 찾기 인증번호 맞게 입력했는지 확인  
    $('#checkTempPw').click(function(){
    	var userinputtemppw = $('#temppw').val();
    	var userinputuserid = $('#userid').val();
    	var userinputemail = $('#email').val();
    	
    	$.ajax({
    		url : '/TicketMvp/user/checkTempPw',
    		type : 'post',
    		data : {"userid" : userinputuserid,
    				"email" : userinputemail,
    				"temppw" : userinputtemppw	},
    		success : function(result){
    			// result에 맞게 입력했으면 1 아니면 null
    			if(result!=null){
    				let url = '/TicketMvp/user/userResetPw.do?userid='+userinputuserid;
    				console.log("작성된 url : "+url);
    				alert("인증번호 맞음");
    				location.replace(url);
    			}else{
                    alert("인증번호를 다시 확인해주세요");
    			}
    		},
            error : function(err){
                console.log(err);
                alert("오류");
            }
    	});
    
    });	// end of click

})