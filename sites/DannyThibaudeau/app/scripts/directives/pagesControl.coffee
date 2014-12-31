angular.module('dannyThibaudeauApp')
.directive('pagesControl', [ '$compile',
  ($compile) ->
    restrict: 'EA'
    scope: true
    templateUrl: 'directives/pagesControl.html'
    controller: ($scope) ->

      class PageControl
        constructor: ->
#          @_items = []

          console.log('page control created')
          console.log($scope.$parent.pages)

          @setActivePage(0)

          if $scope.$parent.pages?
#            @_items = $scope.$parent.pages
            $scope.pages = $scope.$parent.pages

#        getItems: () ->
#          return @_items

        setActivePage: (index) ->
          $scope.activePage = $scope.pages[index]


      return new PageControl()
])
