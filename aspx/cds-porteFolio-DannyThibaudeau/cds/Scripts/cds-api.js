(function () {

    function cdsApi() {

        function getDownloads(item, platform) {
            deferred = $.Deferred(function () {
                var url = 'http://www.cds.porte-folio.danny-thibaudeau.ca/Services/ResInfo/' + item + '/' + platform;
                $.get(url, function (data) {
                    deferred.resolve(data);
                });
            });

            return deferred.promise();
        }

        return {
            getDownloads: getDownloads
        }
    }

    window.cdsApi = cdsApi;
}());
