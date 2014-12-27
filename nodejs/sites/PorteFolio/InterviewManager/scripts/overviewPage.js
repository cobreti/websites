( function() {

    if (typeof initOverviewPage === 'function' ) {
        initOverviewPage();
        return;
    }

    initOverviewPage = function() {

        $(":input[type='radio']").each( function() {

            $(this).on('click', function() {
                var visibleFigure = $("figure:visible");
                visibleFigure.hide();
                var newFigureName = $(this).attr('data-img') + "-img";
                $("#" + newFigureName).show();
            });
        });


        var nav = $(".images-nav");
        var screenshotsContent = $(".screenshots-content");

        nav.show();
        nav.css('left', screenshotsContent.offset().left + 'px');
        nav.css('top', screenshotsContent.innerHeight() + screenshotsContent.position().top + 'px' );

        $(":input[type='radio'][data-img='Login']").attr('checked', 'true');

        $("figure").each( function() {

            $(this).css('left', $(this).parent().position().left + 'px');
            $(this).css('top', $(this).parent().position().top + 'px');
        });
    }

    initOverviewPage();

})();

//@ sourceURL=scripts/overviewPage.js
