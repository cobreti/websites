// Generated by CoffeeScript 1.11.1
(function() {
  angular.module('dannyThibaudeauApp').directive('pagesMenu', [
    '$routeParams', function($routeParams) {
      return {
        restrict: 'EA',
        scope: true,
        require: '^pages-control',
        templateUrl: 'directives/pagesMenu.html',
        link: function($scope, $element, $attr, pagesControl) {
          var SectionMenu;
          SectionMenu = (function() {
            function SectionMenu() {
              this._pagesMenuElm = $element.find('.pages-menu');
              $scope.getClassName = (function(_this) {
                return function() {
                  return _this.getClassName();
                };
              })(this);
              $scope.isVisible = (function(_this) {
                return function(index) {
                  return $scope.selectedItem === index;
                };
              })(this);
              $scope.selectItem = (function(_this) {
                return function(index) {
                  $scope.selectedItem = index;
                  return pagesControl.setActivePage(index);
                };
              })(this);
              $scope.menuItems = $scope.$parent.pages;
              $scope.selectedItem = 0;
            }

            SectionMenu.prototype.getClassName = function() {
              var className;
              className = "pages-menu-default";
              if (($scope.menuItems != null) && $scope.menuItems.length > 0) {
                className = "pages-menu-visible";
              }
              return className;
            };

            return SectionMenu;

          })();
          return new SectionMenu();
        }
      };
    }
  ]);

}).call(this);

//# sourceMappingURL=pagesMenu.js.map
