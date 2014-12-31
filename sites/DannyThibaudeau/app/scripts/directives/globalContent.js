// Generated by CoffeeScript 1.8.0
(function() {
  angular.module('dannyThibaudeauApp').directive('globalContent', [
    'sectionsMgr', function(sectionsMgr) {
      return {
        scope: true,
        restrict: 'EA',
        templateUrl: '../../directives/globalContent.html',
        link: function($scope, $element, $attr) {
          var Content;
          Content = (function() {
            function Content() {
              this._sectionMenu = null;
              $scope.getClass = (function(_this) {
                return function() {
                  return _this.getClass();
                };
              })(this);
              sectionsMgr.on('sectionActivated', (function(_this) {
                return function(section) {
                  if (section != null) {
                    return _this._sectionMenu = section.menu;
                  } else {
                    return _this._sectionMenu = null;
                  }
                };
              })(this));
            }

            Content.prototype.getClass = function() {
              var className;
              className = "global-content-default";
              if (this._sectionMenu != null) {
                className = "global-content-down";
              }
              return className;
            };

            return Content;

          })();
          return new Content();
        }
      };
    }
  ]);

}).call(this);

//# sourceMappingURL=globalContent.js.map