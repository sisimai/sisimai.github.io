// standard.js
jQuery(function($) {
    // #main-slider
    var slideHeight = $(window).height();
    $('#home-slider .item').css('height',slideHeight);

    $(window).resize(function(){'use strict',
        $('#home-slider .item').css('height',slideHeight);
    });

    // Progress Bar
    $('#versus').bind('inview', function(event, visible, visiblePartX, visiblePartY) {
        if (visible) {
            $.each($('div.progress-bar'),function(){
                $(this).css('width', $(this).attr('aria-valuetransitiongoal')+'%');
            });
            $(this).unbind('inview');
        }
    });

    // Countdown
    $('#versus').bind('inview', function(event, visible, visiblePartX, visiblePartY) {
        if (visible) {
            $(this).find('.timer').each(function () {
                var $this = $(this);
                $({ Counter: 0 }).animate({ Counter: $this.text() }, {
                    duration: 2000,
                    easing: 'swing',
                    step: function () {
                        $this.text(Math.ceil(this.Counter));
                    }
                });
            });
            $(this).unbind('inview');
        }
    });
});

