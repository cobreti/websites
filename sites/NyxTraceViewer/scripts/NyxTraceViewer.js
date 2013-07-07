( function() {

    window.LoadContentPage = function LoadContentPage(page) {

        try {

            var req = new XMLHttpRequest();
            req.open('GET', window.location.origin + '/NyxTraceViewer/pages/' + page);
            req.onload = function() {

                var content = $(req.responseText);
                var innerContent = $(document).find('.content-inner');
                innerContent.empty();
                innerContent.append(content);
            }

            req.ontimeout = function() {

                var innerContent = $(document).find('.content-inner');
                innerContent.empty();
            }
            req.onabort = function() {

                var innerContent = $(document).find('.content-inner');
                innerContent.empty();
            }
            req.onerror = function() {

                var innerContent = $(document).find('.content-inner');
                innerContent.empty();
            }
            req.send();
        }
        catch (ex) {

            var innerContent = $(document).find('.content-inner');
            innerContent.empty();
        }
    };


    window.SelectMenuItem = function SelectMenuItem(page) {

        $(document).find('.menu-nav').find('li').each( function() {

            $(this).removeClass('active');
        });

        $(document).find('.menu-nav').find("li[data-page='" + page + "']").each( function() {
            $(this).addClass('active');
        });
    };



}) ();

$(document).ready( function() {

    $(document).find('.menu-nav').find('li').each( function() {

        $(this).click( function() {

            var page = $(this).attr('data-page');
            LoadContentPage(page);
            SelectMenuItem(page);
        });
    });


    LoadContentPage('about.html');
    SelectMenuItem('about.html');
});


