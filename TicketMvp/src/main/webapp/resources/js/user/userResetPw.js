$(function(){

    $('#setpw').click(function () {

        var resetPwForm = $('#resetPwForm')                       // 비밀번호 재설정 jsp안에 form 태그
        var userid = $('#userid').text();                               // 아이디 span태그 값
        var userpw = $('#userpw').val();                                // 비밀번호 태그 값
        var userpwcheck = $('#userpwcheck').val();                      // 비밀번호 확인 태그 값
        var resetPwResult = $('#resetPwResult');		                // 비밀번호 체크 span태그 값
        

         // 비밀번호를 입력 안했을 때
         if (userpw == "" || userpwcheck == "") {
            alert("비밀번호를 입력해주세요");            
            resetPwResult.text("비밀번호를 입력해주세요");
            return false;
        }
		
        // 글자 수 8이상
        if (userpw.length < 8) {
            alert("8자리 이상이여야 합니다");
            resetPwResult.text("8자리 이상이여야 합니다");
            return false;
        }

        // 정규식
        let reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/;   // 정규식
        if (!reg.test(userpw) || reg2.test(userpw)) {
        	alert(userid);
            alert("소문자, 숫자, 특수문자를 모두 포함해야 합니다");
            resetPwResult.text("소문자, 숫자, 특수문자를 모두 포함해야 합니다");
            return false;
        }

        // 같은문자 4번이상 연속 
        let reg2 = /(\w)\1\1\1/ //같은문자 4번이상
        if(reg2.test(userpw)){
            alert("같은 문자가 4번이상 연속될 수 없습니다");
            resetPwResult.text("같은 문자가 4번이상 연속될 수 없습니다");
            return false;
        }

        // 띄어쓰기가 있을 때
        if (userpw.search(" ") != -1) {     // 공백 인덱스의 반환이 없는게 아니면 (즉 공백이 있으면)
            alert("비밀번호에 공백을 포함 할 수 없습니다");
            resetPwResult.text("비밀번호에 공백을 포함 할 수 없습니다");
            return false;
        }

        // 비밀번호와 비밀번호 확인이 맞지 않을 때
        if (userpwcheck == "" || userpw != userpwcheck) {
            //alert("비밀번호 확인이 필요합니다");
            resetPwResult.text("비밀번호 확인이 필요합니다");;
            return false;
        }

        // 비밀번호 맞게 입력후 확인 눌렀을 때
        $.ajax({
            url :'/TicketMvp/user/resetPw',
            type : 'post',
            data : { "userid" : userid,
                    "userpw" : userpw },
            dataType : 'json',
            success : function(result){
				if(result!=null){
	                alert("비밀번호 변경이 완료되었습니다."+"<br/>"+"로그인창으로 이동합니다");
    	            //location.replace('/TicketMvp/user/userLoginForm');		
				}
				else{
					alert("비밀번호 변경에 실패");
				}
            },
            error : function(err){
                alert("오류");
                return false;
            }
        })

    });

})