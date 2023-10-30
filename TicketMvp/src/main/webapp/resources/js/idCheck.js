
$(function(){

    // 아이디 중복 확인버튼 눌렀을 때 
    $('#idCheck').click(function(){					// 중복확인 버튼을 클릭했을 때로 하고 싶은데 그러면 jsp에서 어떻게 연결해야 하는지 모르겠음
    //function checkId(){

        /* 사용자가 입력한 아이디 가져와야함 */
        var userinputid = $('#userid').val();
        //alert(userinputid);						// 사용자가 입력한 아이디 확인됨.

        $.ajax({
            url : '../userIdCheck',                  //Controller에서 요청받을 주소
            type : 'post',
            data : {"id" : userinputid},
            success : function(idCheckResult){             //Controller에서 넘어온 idCheckResult 받기
                if(idCheckResult == 0){                    //idCheckResult - 
                    $('#idCheckResult').text("사용가능한 아이디 입니다");
                } else{
                    $('#idCheckResult').text("사용중인 아이디 입니다");
                }
            },
            error : function(){
            	
                alert("오류..");
            }
        });

    //};
});



})




