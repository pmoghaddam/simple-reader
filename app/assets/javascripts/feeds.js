$(document).ready(function () {
    $('.feed-item').click(function () {
        var $this = $(this);
        $('.feed-body', $this).slideToggle();

        // Declare as read
        var id = $this.attr('data-id');
        $.ajax({
            type: "POST",
            url: '/api/v1/feed_items/read.json',
            data: { _method: 'PUT', id:id },
            dataType: 'json',
            success: function (msg) {
                $this.addClass('read');
            }
        });
    });
});