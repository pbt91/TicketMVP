$(function () {
		
        // 이메일 select 눌렀을 때
        $('#mailslc').change(function(){        
            $('#email').val(this.value);   // 해당 값으로 바꿔줌

        })

        // 수정하기 눌렀을 때
        $('#modify').click(function () {
        		// 이메일 변수에 사용자입력값+@+option 들어가야함
            	var emailfull = $('#emailid').val()+"@"+$('#email').val();
        		
                // 이름, 이메일, 연락처
                /*var usermodify = document.usermodify;     // 회원정보수정 form 태그
                const name = usermodify.name;
                const email = usermodify.email;
                const phone = usermodify.phone;*/
                var name = $('#name').val();
                var email = $('#email').val();
                var phone = $('#phone').val();
                //alert(name+"/"+emailfull+"/"+phone);
                // 입력을 안했을 때
                if (name == "" || email == "" || phone == "") {
                        alert("이름 이메일 연락처 필수로 입력해야 합니다");
                        return false;
                }
                
                // 공백이 있을 때
                if (name.search(" ") != -1 || email.search(" ") != -1 || phone.search(" ") != -1) {
                        alert("이름 이메일 연락처에 공백을 포함 할 수 없습니다");
                        return false;
                }
                
                // 전화번호에 숫자 말고 다른거 넣었을 때
                var num_check = /^[0-9]*$/;
                if (num_check.test(phone)) {


                } else {
                        alert("연락처는 '-'을 제외하고 숫자만 입력해주세요");
                        return false;
                }


                // 비밀번호 입력을 안했을 때
                var userid = $('#userid').val();
                var userpw = $('#userpw').val();                // userpw 사용자 입력 값
                var userpwcheck = $('#userpwcheck').val();      // userpwcheck 사용자 입력 값
                var userpw_span = $('#userpw_span');            // span 태그 
                if (userpw == "") {
                        if (!confirm("비밀번호는 그대로 유지하시겠습니까?")) {
                                // 취소 눌렀을 때 비밀번호 입력창으로 포커스
                                $('#userpw').focus();
                                return false;
                        } else {       						
                                // 확인 눌렀을 때 비밀번호 변경 안하고 그대로 나머지 정보 넘김
                                var exceptpw = true;
                                //alert("아작 직전 : "+name+"/"+emailfull+"/"+phone+"/"+exceptpw);
                                $.ajax({
                                        url : "/TicketMvp/user/userModify",
                                        type : 'post',
                                        dataType : 'json',
                                        data : { "userid" : userid,
                                        		 "name" : name,
                                                 "email" : emailfull,
                                                 "phone" : phone,
                                                 "exceptpw" : exceptpw
                                         },
                                         success : function(result){
                                                alert(" 수정이 완료되었습니다. ");
                                                location.replace("/TicketMvp/user/userMyMain.do");
                                         },
                                         error : function(error){
                                                alert("수정안됨");
                                         }
        
                                 }) // end of ajax
                        }
                } else {  // 비밀번호 입력 했을 떄

                        // 글자 수 8이상
                        if (userpw.length < 8 || userpw.length > 16) {
                                userpw_span.text("8~15자리로");
                                //alert("비밀번호는 8자리 이상이여야 합니다");
                                userpw.focus();
                                return false;
                        }

                        // 정규식
                        let reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/;   // 정규식
                        if (!reg.test(userpw)) {
                                userpw_span.text("소문자, 숫자, 특수문자를 모두 포함한 조합만으로");
                                //alert("비밀번호는 소문자, 숫자, 특수문자를 모두 포함해야 합니다");
                                userpw.focus();
                                return false;
                        }

                        // 같은문자 4번이상 연속 
                         let reg2 = /(\w)\1\1\1/ //같은문자 4번이상
                         if (reg2.test(userpw)) {
                                userpw_span.text("같은 문자가 연속 4번 미만으로");
                                //alert("비밀번호는 같은 문자가 4번이상 연속될 수 없습니다");
                                 userpw.focus();
                                 return false;
                         }
 
                         // 띄어쓰기가 있을 때
                         let reg3 = /[\s]/g;
                         if (reg3.test(userpw)) {     // 공백 인덱스의 반환이 없는게 아니면 (즉 공백이 있으면)
                                userpw_span.text("띄어쓰기가 포함되지 않아야 ");
                                //alert("비밀번호에 공백을 포함 할 수 없습니다");
                                 userpw.focus();
                                 return false;
                         }
 
                         // 비밀번호와 비밀번호 확인이 맞지 않을 때
                         if (userpwcheck == "" || userpw != userpwcheck) {
                                 userpw_span.text("비밀번호 확인창과 같은 같아야만")
                                 //alert("비밀번호가 확인창과 일치하지 않습니다");
                                 userpwcheck.focus();
                                 return false;
                         }
                         var exceptpw = false;
                         // 이메일 변수에 사용자입력값+@+option 들어가야함
        				var emailfull = $('#emailid').val()+"@"+$('#email').val()
        				console.log(emailfull);
                         $.ajax({
                                url : "/TicketMvp/user/userModify",
                                type : 'post',
                                dataType : 'json',
                                data : { "userid" : userid,
                                		 "name" : name,
                                         "email" : emailfull,
                                         "phone" : phone,
                                         "userpw" : userpw,
                                         "exceptpw" : false
                                 },
                                 success : function(result){
                                        alert(" 수정이 완료되었습니다. ");
                                        location.href("/TicketMvp/user/userMyMain.do");
                                 },
                                 error : function(error){
                                        alert("수정안됨");
                                 }

                         }) // end of ajax

                } // end of else 비밀번호 입력했을때

        }) // end of $('#modify').click

})

