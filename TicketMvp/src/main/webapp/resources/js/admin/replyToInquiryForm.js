$(function(){
	let replytextExists = Boolean($.trim($('#replytext').val()));

	//답변 button 클릭 시
    $(document).on('click', 'input#replysubmit', function (e){
        e.preventDefault(); 
        
        //답변 첫 등록/수정 확인
        let confirmMessage = replytextExists ? "답변을 수정하시겠습니까?" : "이 문의에 답변하시겠습니까?";
        
        // 답변 등록 전 
        if (confirm(confirmMessage)) {
            // form 데이터 입력
            let helpid = $('#helpid').text();
            let replytext = $('#replytext').val();
            
            //답변 내요이 없으면 막음
            if(!replytext) {
            	 alert("답변 내용을 입력해 주세요.");
            	return;
            }

            // 답변 등록 ajax
            $.ajax({
                type: "POST",
                url: "/TicketMvp/adminViewsJspFile/replyToInquiry.do",
                data: { helpid: helpid, replytext: replytext },
                success: function(response) {
                    if (response === "success") {
                   		alert(replytextExists ? "답변이 수정되었습니다." : "답변이 등록되었습니다.");
                        window.location.href = "/TicketMvp/adminViewsJspFile/handleInquiry.do";
                    } else {
                        alert(replytextExists ? "답변 수정에 실패하였습니다." : "답변 등록에 실패하였습니다.");
                    }
                },
                error: function() {
                    alert("서버 오류가 발생하였습니다.");
                }
            });
        }
    });
});