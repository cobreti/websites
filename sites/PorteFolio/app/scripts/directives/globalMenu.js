// Generated by CoffeeScript 1.11.1
(function() {
  angular.module('dannyThibaudeauApp').directive('globalMenu', [
    '$route', '$routeParams', 'sectionsMgr', function($route, $routeParams, sectionsMgr) {
      return {
        restrict: 'EA',
        scope: true,
        templateUrl: 'directives/globalMenu.html',
        link: function($scope, $element, $attributes) {
          var GlobalMenu;
          GlobalMenu = (function() {
            function GlobalMenu() {
              this.globalMenuElm = $element.find('.global-menu');
              sectionsMgr.on('sectionActivated', (function(_this) {
                return function(section) {
                  return _this.setMenuPosition(section);
                };
              })(this));
              this.setMenuPosition(sectionsMgr.getCurrentSection());
            }

            GlobalMenu.prototype.updateFollowingRouteChange = function(current) {
              return this.setMenuPosition();
            };

            GlobalMenu.prototype.setMenuPosition = function(section) {
              if (section != null) {
                this.globalMenuElm.removeClass('global-menu-bottom');
                return this.globalMenuElm.addClass('global-menu-top');
              } else {
                this.globalMenuElm.addClass('global-menu-bottom');
                return this.globalMenuElm.removeClass('global-menu-top');
              }
            };

            return GlobalMenu;

          })();
          return new GlobalMenu();
        }
      };
    }
  ]);

}).call(this);

//# sourceMappingURL=globalMenu.js.map
