( function() {

    window.LoadContentPage = function LoadContentPage(page, scriptFile) {

        var innerContent = $(document).find('.content-inner');
        innerContent.empty();

        try {

            var req = new XMLHttpRequest();
            req.open('GET', window.location.origin + '/InterviewManager/pages/' + page);
            req.onload = function() {

                var content = $(req.responseText);
                innerContent.append(content);

                if (typeof scriptFile !== 'undefined') {
                    $.getScript('../InterviewManager/scripts/' + scriptFile)
                }
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


    $(document).ready( function() {

        $(document).find('.menu-nav').find('li').each( function() {

            $(this).click( function() {

                var page = $(this).attr('data-page');
                var scriptFile = $(this).attr('data-script-file');
                LoadContentPage(page, scriptFile);
                SelectMenuItem(page);
            });
        });

        LoadContentPage('overview.html', 'overviewPage.js');
        SelectMenuItem('overview.html');
    });

}) ();


