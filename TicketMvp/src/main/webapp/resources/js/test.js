
$(function(){
 	// Function to load content using AJAX
    function loadContent(url) {
        $.ajax({
            url: url,
            type: 'GET',
            success: function(html) {
                $('#section2').html(html);
            },
            error: function(xhr, status, error) {
                console.error('There has been a problem with your AJAX operation:', error);
            }
        });
    }

    // Attach event listeners to links using jQuery
    $('#linkReserveChoose, #linkBillingFail').on('click', function(e) {
        e.preventDefault(); 
        loadContent($(this).attr('href'));
    });
})