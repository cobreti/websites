// Generated by CoffeeScript 1.8.0
(function() {
  angular.module('dannyThibaudeauApp').directive('downloads', [
    function() {
      ({
        restrict: 'EA',
        scope: true,
        templateUrl: ''
      });
      return function($scope, $element, $attr) {
        var Downloads;
        Downloads = (function() {
          function Downloads() {
            this.cdsApi = new cdsApi();
            this.cdsApi.getDownloads('InterviewManager', 'Windows').then((function(_this) {
              return function(data) {
                return console.log(data);
              };
            })(this));
          }

          return Downloads;

        })();
        return new Downloads();
      };
    }
  ]);

}).call(this);

//# sourceMappingURL=downloads.js.map