$(document).ready(function () {
    $('.feed-item .title').click(function () {
        var $item = $(this).closest('.feed-item');
        $('.feed-body', $item).slideToggle();

        var id = $item.attr('data-id');
        $.ajax({
            type: "POST",
            url: '/api/v1/feed_items/read.json',
            data: { _method: 'PUT', id:id },
            dataType: 'json',
            success: function (msg) {
                $item.addClass('read');
            }
        });
    });

    $('.feed-item .star').click(function() {
        var $star = $(this);
        var $item = $star.closest('.feed-item');
        var success = function (msg) {
            $star.toggleClass('active');
        };
        var method = $star.hasClass('active') ? 'unstar' : 'star';
        var id = $item.attr('data-id');

        $.ajax({
            type: "POST",
            url: '/api/v1/feed_items/' + method + '.json',
            data: { _method: 'PUT', id:id },
            dataType: 'json',
            success: success
        });
    });

    $('.feed-item .unread').click(function() {
        var $link = $(this);
        var $item = $link.closest('.feed-item');

        var id = $item.attr('data-id');
        $.ajax({
            type: "POST",
            url: '/api/v1/feed_items/unread.json',
            data: { _method: 'PUT', id:id },
            dataType: 'json',
            success: function (msg) {
                $item.removeClass('read');
            }
        });
    });
});