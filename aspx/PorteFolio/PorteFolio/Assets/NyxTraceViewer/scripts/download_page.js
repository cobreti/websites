( function() {

    if (typeof initDownloadPage === 'function') {
        initDownloadPage();
        return;
    }

    initDownloadPage = function() {

        $(".download-platform").empty();

        getDownloadFilesList();
    };

    getDownloadFilesList = function() {

        var subpath = window.location.pathname.substr(0, window.location.pathname.lastIndexOf('/'));

        subpath += '/files/get';

        var req = new XMLHttpRequest();
        req.open('GET', subpath);
        req.setRequestHeader('content-type', 'text/javascript');
        req.onload = function() {
            var data = $.parseJSON(req.responseText);
            addDownloadFiles(data);
        };
        req.send();
    };

    addDownloadFiles = function(files) {

        addWindows64_DownloadFiles(files.Windows_64);
        addOSX64_DownloadFiles(files.OSX_64);
        addLinux64_DownloadFiles(files.Linux_64);
    };

    addLinux64_DownloadFiles = function(files) {

        if (typeof files === 'undefined') {
            return;
        }

        var Linux64 = createDownloadItem('Linux (64 bits)', files, 'files/Linux_64/');

        var noteTitle = $('<div></div>');
        noteTitle.addClass('notes-title');
        noteTitle.text('Install notes');

        var note = $('<div></div>');
        note.addClass('notes-content');

        var par = $('<p></p>');
        par.html('The package contains a file called install.sh that must be run with root privileges.<br><br>Ex:<br>« sudo install.sh »');
        note.append(par);

        Linux64.find('.download-item-content').append(noteTitle);
        Linux64.find('.download-item-content').append(note);

        $('.download-platform').append(Linux64);

    };

    addWindows64_DownloadFiles = function(files) {

        if (typeof files === 'undefined') {
            return;
        }

        var Windows64 = createDownloadItem('Windows (64 bits)', files, 'files/Windows_64/');
        $('.download-platform').append(Windows64);

    };

    addOSX64_DownloadFiles = function(files) {

        if (typeof files === 'undefined') {
            return;
        }

        var OSX64 = createDownloadItem('OS X (64 bits)', files, 'files/OSX_64/');
        $('.download-platform').append(OSX64);

    }

    createDownloadItem = function(title, items, path) {

        var downloadItem = $('<div></div>');
        downloadItem.addClass('download-item');

        var titleItem = $('<div></div>');
        titleItem.addClass('download-item-content');
        titleItem.text(title);
        downloadItem.append(title);

        var contentItem = $('<div></div>');
        contentItem.addClass('download-item-content');
        downloadItem.append(contentItem);

        var contentList = $('<ul></ul>');
        contentItem.append(contentList);

        for (var file in items) {
            var li = $('<li></li>');

            var link = $('<a></a>');
            link.attr('href', path + file);
            link.text(file);
            li.append(link);

            contentList.append(li);
        }

        return downloadItem;
    };

    initDownloadPage();

}) ();

//@ sourceURL=scripts/download_page.js
