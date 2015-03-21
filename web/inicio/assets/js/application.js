var offset = $( "header" ).offset();

// ------------------------------
// =UTILITY BELT
// Psst: Search for '=u' to come straight here. You're welcome.
// ------------------------------
var Utility = {
    str_replace: function(c, d, b) {
        var a = c.split(d);
        return a.join(b);
    },
    str_exists: function(b, c) {
        var a = b.split(c);
        if (a[0] === b) {
            return false;
        } else {
            return true;
        }
    },
    getBrandColor: function (name) {
        // Store Brand colors in JS so it can be called from plugins
        var brandColors = {
            'default':      '#ecf0f1',
            'gray':         '#aaa',

            'inverse':      '#95a5a6',
            'primary':      '#3498db',
            'success':      '#2ecc71',
            'warning':      '#f1c40f',
            'danger':       '#e74c3c',
            'info':         '#1abcaf',
            
            'brown':        '#c0392b',
            'indigo':       '#9b59b6',
            'orange':       '#e67e22',
            'midnightblue': '#34495e',
            'sky':          '#82c4e6',
            'magenta':      '#e73c68',
            'purple':       '#e044ab',
            'green':        '#16a085',
            'grape':        '#7a869c',
            'toyo':         '#556b8d',
            'alizarin':     '#e74c3c'
        };

        if (brandColors[name]) {
            return brandColors[name];
        } else {
            return brandColors['default'];
        }
    },
    keepHeaderFixed: function () {
        if ( $('body').scrollTop() > offset.top){
            $('body').addClass('header-fixed-top');
        } else {
             $('body').removeClass('header-fixed-top');
        }
    }
};
// ------------------------------
// =/U
// ------------------------------



// ------------------------------
// =PLUGINS. custom made shizzle, yo!
// ------------------------------
(function($) {
    // ------------------------------
    // Sidebar Accordion Menu
    // ------------------------------
    $.sidebarAccordion = function(element, options) {
        var defaults = {};
        var plugin = this;

        plugin.settings = {};
        var $element = $(element),
            element = element;

        plugin.init = function() {
            plugin.settings = $.extend({}, defaults, options);

            var menuCollapsed = localStorage.getItem('collapsed_menu');
            if (menuCollapsed === null) {
                localStorage.setItem('collapsed_menu', "false");
            }
            if (menuCollapsed === "true") {
                $('body').addClass('sidebar-collapsed');
            }

            $('body').on('click', 'ul.acc-menu a', function() {
                var LIs = $(this).closest('ul.acc-menu').children('li');
                $(this).closest('li').addClass('clicked');
                $.each( LIs, function(i) {
                    if( $(LIs[i]).hasClass('clicked') ) {
                        $(LIs[i]).removeClass('clicked');
                        return true;
                    }
                    $(LIs[i]).find('ul.acc-menu:visible').slideToggle();
                    $(LIs[i]).removeClass('open');
                });

                if (!$('body').hasClass('sidebar-collapsed') || $(this).parents('ul.acc-menu').length > 1) {
                    if($(this).siblings('ul.acc-menu:visible').length>0)
                        $(this).closest('li').removeClass('open');
                    else
                        $(this).closest('li').addClass('open');
                        $(this).siblings('ul.acc-menu').slideToggle({
                            duration: 200
                        });
                }
            });

            var targetAnchor;
            $.each ($('ul.acc-menu a'), function() {
                if( this.href == window.location ) {
                    targetAnchor = this;
                    return false;
                };
            });

            var parent = $(targetAnchor).closest('li');
            while(true) {
                parent.addClass('active');
                parent.closest('ul.acc-menu').show().closest('li').addClass('open');
                parent = $(parent).parents('li').eq(0);
                if( $(parent).parents('ul.acc-menu').length <= 0 ) break;
            };

            var liHasUlChild = $('li').filter(function(){
                return $(this).find('ul.acc-menu').length;
            });
            $(liHasUlChild).addClass('hasChild');

        };
        plugin.init();
    }
    $.fn.sidebarAccordion = function(options) {
        return this.each(function() {
            if (undefined === $(this).data('sidebarAccordion')) {
                var plugin = new $.sidebarAccordion(this, options);
                $(this).data('sidebarAccordion', plugin);
            }
        });
    }
})(jQuery);
// ------------------------------
// =/P
// ------------------------------




// ------------------------------
// =DOM Ready
// ------------------------------
$(document).ready(function () { 
    // ------------------------------
    // Sidebar Accordion
    // ------------------------------
    $('body').sidebarAccordion(); 

    // ------------------------------
    // Megamenu
    // This code will prevent unexpected menu close 
    // when using some components (like accordion, forms, etc)
    // ------------------------------
    $('body').on('click', '.yamm .dropdown-menu, .dropdown-menu-form', function(e) {
      e.stopPropagation()
    });


    // -------------------------------
    // Sidebars Disabled Links
    // -------------------------------

    $('li.disabled-link a').click(function(e) { 
        e.preventDefault(); 
        e.stopPropagation(); 
        return false; 
    });

    // ------------------------------
    // HeaderNav Active Class change based on page
    // ------------------------------

    $.each ($('#headernav .smart-menu a'), function() {
        if( this.href == window.location ) {
            $(this).closest('ul.smart-menu>li').addClass('active');
        }
    });


});



// ------------------------------
// DOM Loaded
// ------------------------------

$(window).scroll(function() {
    Utility.keepHeaderFixed();
});
