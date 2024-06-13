/* libsisimai.js */
jQuery(function($) {
    // Preloader
    var preloader = $('.preloader');
    $(window).load(function(){
        preloader.remove();
    });

    // Scroll Menu
    var slideHeight = $(window).height();
    $(window).on('scroll', function(){
        if( $(window).scrollTop()>slideHeight ){
            $('.main-nav').addClass('navbar-fixed-top');
        } else {
            $('.main-nav').removeClass('navbar-fixed-top');
        }
    });

    // Navigation Scroll
    $(window).scroll(function(event) {
        Scroll();
    });

    $('.navbar-collapse ul li a').on('click', function() {
        $('html, body').animate({scrollTop: $(this.hash).offset().top - 50}, 1000);
        return false;
    });

    // User define function
    function Scroll() {
        var contentTop      = [];
        var contentBottom   = [];
        var winTop          = $(window).scrollTop();
        var rangeTop        = 200;
        var rangeBottom     = 500;
        $('.navbar-collapse').find('.scroll a').each( function(){
            contentTop.push( $( $(this).attr('href') ).offset().top);
            contentBottom.push( $( $(this).attr('href') ).offset().top + $( $(this).attr('href') ).height() );
        });
        $.each( contentTop, function(i){
            if( winTop > contentTop[i] - rangeTop ){
                $('.navbar-collapse li.scroll')
                    .removeClass('active')
                    .eq(i).addClass('active');
            }
        })
    };

    $('#tohash').on('click', function(){
        $('html, body').animate({scrollTop: $(this.hash).offset().top - 50}, 1000);
        return false;
    });
});

