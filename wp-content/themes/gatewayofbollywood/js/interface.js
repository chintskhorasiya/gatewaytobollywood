﻿!function(o){"use strict";o(function(i){o(".js-navbar");o(".js-target-scroll").on("click",function(i){var e=o(this.hash);if(e.length)return o("html,body").animate({scrollTop:e.offset().top-80+1},1e3),!1}),o("#category_slider .owl-carousel").owlCarousel({loop:!0,margin:15,nav:!0,autoplay:!0,autoplayTimeout:5e3,responsive:{0:{items:1},600:{items:3},900:{items:4},1200:{items:6}}}),o("#category_slider2 .owl-carousel").owlCarousel({loop:!0,margin:30,nav:!0,dots:!1,autoplay:!0,autoplayTimeout:5e3,responsive:{0:{items:1},600:{items:2},900:{items:3},1200:{items:4}}}),o("#popular_listing_slider .owl-carousel").owlCarousel({loop:!0,margin:15,nav:!0,dots:!1,autoplay:!0,autoplayTimeout:5e3,responsive:{0:{items:1},700:{items:2},1200:{items:3}}}),o("#testimonial_slider .owl-carousel").owlCarousel({loop:!0,margin:0,nav:!0,autoplay:!0,autoplayTimeout:5e3,responsive:{0:{items:1},1e3:{items:1}}}),o("#listing_img_slider .owl-carousel").owlCarousel({loop:!0,margin:0,nav:!0,dots:!1,autoplay:!0,autoplayTimeout:5e3,responsive:{0:{items:1},400:{items:2},768:{items:3},992:{items:4}}}),o("#dashboard-responsive-nav-trigger").on("click",function(i){o("#dashboard-nav").toggle("show")}),o(function(){o("#navigation li.menu-item-has-children .arrow").on("click",function(i){i.stopPropagation();o(this).siblings("ul.sub-menu").slideToggle()}),o("#navigation li.menu-item-has-children .arrow").on("click",function(o){o.stopImmediatePropagation()})});var e=o("#back-top");e.hide(),o(window).scroll(function(){o(this).scrollTop()>100?e.fadeIn():e.fadeOut()}),o("#back-top a").on("click",function(i){return o("body,html").animate({scrollTop:0},800),!1})})}(jQuery);