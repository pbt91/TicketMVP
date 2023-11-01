
$(function () {

    // 아이디 중복 확인버튼 눌렀을 때 
    $('#idCheck').click(function () {

        /* 사용자가 입력한 아이디 가져와야함 */
        var userinputid = $('#userid').val();
        //alert(userinputid);						// 사용자가 입력한 아이디 확인됨.

        $.ajax({
            url: '../user/userIdCheck',                  //Controller에서 요청받을 주소
            type: 'post',
            dataType: 'json',
            data: { "id": userinputid },
            success: function (idCheckResult) {             //Controller에서 넘어온 idCheckResult 받기
                if (idCheckResult == 0) {                    //#idCheckResult - 아이디 중복확인 결과 표시 span 태그
                    $('#idCheckResult').text("사용가능한 아이디 입니다");
                }else{
                    $('#idCheckResult').text("사용중인 아이디 입니다");
                }
                if(userinputid.equals("")){
                    $('#idCheckResult').text("아이디를 입력해주세요");
                }
            },
            error: function (error) {
                alert("오류");
                console.log("오류메세지 : " + err);
            }
        });

    });


    $('#join').click(function () {

        const userinputForm = document.userinput;     // 회원가입 jsp안에 form 태그
        
        // 1 아이디 유효성 검사
        // 1-1 입력을 안했을 때
        const userid = userinputForm.userid;    // 사용자가 입력한 아이디 가져오기
        if (userid.value == "") {
            alert("아이디가 누락되었습니다");
            //idCheckResult.text("아이디가 누락되었습니다");        // 나중에 $('#idCheckResult').text("아이디를 입력하세요");
            userid.focus();                     // 색도 지정하고 싶으면 userid.style.borderColor="";
            return false;
        }

        // 1-2 글자 수 5이상 12이하
        if (userid.value.length <= 5 || userid.value.length >= 12) {
            alert("아이디는 5자리 이상 12자리 이하로 작성되어야 합니다");
            //idCheckResult.text("아이디는 5자리 이상 12자리 이하로 작성되어야 합니다");
            userid.focus();
            return false;
        }

        // 1-3 아이디 중복 검사 안했을 때
        const idCheckResult = document.getElementById("idCheckResult").innerHTML;    // 중복검사 결과창 태그안 값
        if (idCheckResult == "") {                                 // 결과창이 비어있으면 
            alert("아이디 중복검사가 누락되었습니다");
            //idCheckResult.text("아이디 중복검사가 누락되었습니다");
            return false;
        }

        //1-4 아이디가 중복되었는데 가입하려 했을 때
        if (idCheckResult == "사용중인 아이디 입니다") {
            alert("아이디가 중복되었습니다");
            //idCheckResult.text("아이디가 중복되었습니다");
            userid.focus();
            return false;
        }


        // 2 비밀번호 유효성검사
        //입력을 안했을 때
        const userpw = userinputForm.userpw;                            // 비밀번호 태그
        const userpwcheck = userinputForm.userpwcheck;                  // 비밀번호 확인태그
        //const pwcheckResult = userinputForm.pwcheckResult.innerHTML;    // 비밀번호 체크 span태그 값
        if (userpw.value == "") {
            alert("비밀번호를 입력해주세요");            
            //pwcheckResult.text("비밀번호를 입력해주세요");
            userpw.focus();
            return false;
        }

        // 글자 수 8이상
        if (userpw.value.length < 8) {
            alert("8자리 이상이여야 합니다");
            //pwcheckResult.text("8자리 이상이여야 합니다");
            userpw.focus();
            return false;
        }

        // 정규식
        let reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/;   // 정규식
        let reg2 = /(\w)\1\1\1/ //같은문자 4번이상
        if (!reg.test(userpw.value) || reg2.test(userpw.value)) {
            alert("소문자, 숫자, 특수문자를 모두 포함해야 합니다");
            //pwcheckResult.text("소문자, 숫자, 특수문자를 모두 포함해야 합니다");
            userpw.focus();
            return false;
        }

        // 같은문자 4번이상 연속 
        if(reg2.test(userpw.value)){
            alert("같은 문자가 4번이상 연속될 수 없습니다");
            //pwcheckResult.text("같은 문자가 4번이상 연속될 수 없습니다");
            userpw.focus();
            return false;
        }

        // 띄어쓰기가 있을 때
        if (userpw.value.search(" ") != -1) {     // 공백 인덱스의 반환이 없는게 아니면 (즉 공백이 있으면)
            alert("비밀번호에 공백을 포함 할 수 없습니다");
            //pwcheckResult.text("비밀번호에 공백을 포함 할 수 없습니다");
            userpw.focus();
            return false;
        }

        // 비밀번호와 비밀번호 확인이 맞지 않을 때
        if (userpwcheck.value == "" || userpw.value != userpwcheck.value) {
            alert("비밀번호 확인이 필요합니다");
            //pwcheckResult.text("비밀번호 확인이 필요합니다");
            userpwcheck.focus();
            return false;
        }

        // 이름, 이메일, 연락처
        // 입력을 안했을 때
        const name = userinputForm.name;
        const email = userinputForm.email;
        const phone = userinputForm.phone;
        if (name.value == "" || email.value == "" || phone.value == "") {
            alert("이름 이메일 연락처 필수로 입력해야 합니다");
            return false;
        }

        // 공백이 있을 때
        if (name.value.search(" ") != -1 || email.value.search(" ") != -1 || phone.value.search(" ") != -1) {
            alert("이름 이메일 연락처에 공백을 포함 할 수 없습니다");
            return false;
        }

        return true;

    });
})