// Generated by CoffeeScript 1.8.0
(function() {
  angular.module('dannyThibaudeauApp').directive('page', [
    '$compile', function($compile) {
      return {
        restrict: 'EA',
        scope: true,
        templateUrl: 'directives/page.html',
        link: function($scope, $element, $attr) {
          var Page;
          Page = (function() {
            function Page() {
              console.log('page created');
              console.log($scope.$parent.activePage);
              console.log($scope.page);
              if ($scope.page.url != null) {
                this.loadPage();
              }
              $scope.active = false;
              $scope.$parent.$watch('activePage', (function(_this) {
                return function() {
                  console.log("active page changed - " + $scope.page.url + " - " + $scope.$parent.activePage.url);
                  if (($scope.page.url != null) && ($scope.$parent.activePage.url != null)) {
                    $scope.active = $scope.page.url === $scope.$parent.activePage.url;
                    return console.log("active = " + $scope.active);
                  } else {
                    return $scope.active = false;
                  }
                };
              })(this));
            }

            Page.prototype.loadPage = function() {
              var content, url;
              url = $scope.page.url;
              content = $compile("<ng-include src=\"'" + url + "'\"></ng-include>")($scope);
              return $element.find('.page-root').append(content);
            };

            return Page;

          })();
          return new Page();
        }
      };
    }
  ]);

}).call(this);

//# sourceMappingURL=page.js.map
