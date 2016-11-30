angular.module('dannyThibaudeauApp')
.directive('pagesMenu', ['$routeParams',
    ($routeParams) ->
      restrict: 'EA'
      scope: true
      require: '^pages-control'
      templateUrl: 'directives/pagesMenu.html'
      link: ($scope, $element, $attr, pagesControl) ->

        class SectionMenu
          constructor: ->

            @_pagesMenuElm = $element.find('.pages-menu')

            $scope.getClassName = () => @getClassName()
            $scope.isVisible = (index) =>
              return $scope.selectedItem == index

            $scope.selectItem = (index) =>
              $scope.selectedItem = index
              pagesControl.setActivePage(index)

            $scope.menuItems = $scope.$parent.pages
            $scope.selectedItem = 0

          getClassName: () ->
            className = "pages-menu-default"

            if $scope.menuItems? && $scope.menuItems.length > 0
              className = "pages-menu-visible"

            return className

        return new SectionMenu()
])
