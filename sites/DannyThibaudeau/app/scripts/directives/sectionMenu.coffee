angular.module('dannyThibaudeauApp')
.directive('sectionMenu', ['sectionsMgr', '$routeParams',
    (sectionsMgr, $routeParams) ->
      scope: true
      restrict: 'EA'
      templateUrl: 'directives/sectionMenu.html'
      link: ($scope, $element, $attr) ->

        class SectionMenu
          constructor: ->

            @_section = null

            console.log('route params')
            console.log($routeParams)

            $scope.getClassName = () => @getClassName()

            $scope.isVisible = (index) =>
              return $scope.selectedItem == index

            $scope.selectItem = (index) =>
              $scope.selectedItem = index
              $scope.menuItems[index].selHandler()

            $scope.menuItems = []
            $scope.selectedItem = 0

            sectionsMgr.on('sectionActivated', (section) =>
              if section?
                $scope.menuItems = section.menu
                @_section = section

                if $routeParams.idx?
                  $scope.selectedItem = parseInt($routeParams.idx)
                else
                  $scope.selectedItem = 0

              else
                @section = null
                $scope.menuItems = []
            )

          getClassName: () ->
            className = "section-menu-default"

            if $scope.menuItems? && $scope.menuItems.length > 0
              className = "section-menu-visible"

            return className

        return new SectionMenu()
])
