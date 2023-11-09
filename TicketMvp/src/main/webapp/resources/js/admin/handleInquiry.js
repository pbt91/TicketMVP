$(function(){
	// 문의 제목 클릭하면 넘어가기
	$(document).on('click', 'td.helptitle', function (){
		window.location.replace("/TicketMvp/adminViewsJspFile/replyToInquiryForm.do?helpid="+$(this).closest('tr').find('td:first').text());
	});
})