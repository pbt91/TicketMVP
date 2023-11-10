$(function(){

    $('#login-form-submit').click(function () {
		alert("dddd");

        var userid = $('#userid').val();
        var userpw = $('#userpw').val();
        
        alert(userid+"/"+userpw);
        $.ajax({
            url: "/TicketMvp/user/loginCheck.do",
            type: "post",
            data: {
                "userid": userid,
                "userpw": userpw
            },
            success: function (result) {
                alert("dd")
                if (result == null || result==='') {
                    alert(result);
                    $('#login-error-msg').css('opacity', '');
                }else {
                	location.href("/TicketMvp/user/userLoginStatus.do");
                }
            }, error: function (err) {
                alert("오류");
                console.log(err);
            }

        });

    });


})