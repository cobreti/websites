// Generated by CoffeeScript 1.11.1
(function() {
  angular.module('dannyThibaudeauApp').directive('globalHeader', [
    '$location', '$route', 'sectionsMgr', function($location, $route, sectionsMgr) {
      return {
        restrict: 'EA',
        scope: true,
        templateUrl: 'directives/globalHeader.html',
        link: function($scope, $element, $attr) {
          var GlobalHeader;
          GlobalHeader = (function() {
            function GlobalHeader() {
              this.sectionTitleElm = $element.find('.section-title');
              sectionsMgr.on('sectionActivated', (function(_this) {
                return function(section) {
                  if (section != null) {
                    _this.sectionTitleElm.text(section.title);
                    _this.sectionTitleElm.removeClass('section-title-hidden');
                    return _this.sectionTitleElm.addClass('section-title-visible');
                  } else {
                    _this.sectionTitleElm.removeClass('section-title-visible');
                    return _this.sectionTitleElm.addClass('section-title-hidden');
                  }
                };
              })(this));
              $scope.$on('$routeChangeSuccess', (function(_this) {
                return function() {
                  return $scope.originalPath = $route.current.originalPath;
                };
              })(this));
              $scope.originalPath = $route.current.originalPath;
              $scope.goHome = (function(_this) {
                return function() {
                  console.log('going home');
                  $location.path('/');
                };
              })(this);
            }

            return GlobalHeader;

          })();
          return new GlobalHeader();
        }
      };
    }
  ]);

}).call(this);

//# sourceMappingURL=globalHeader.js.map
