angular.module('dannyThibaudeauApp')
.directive('pagesControl', [
  () ->
    restrict: 'EA'
    scope: true
    templateUrl: 'directives/pagesControl.html'
    controller: ($scope) ->

      class PageControl
        constructor: ->
          @_items = []

          console.log('page control created')
          console.log($scope.$parent.pages)

          if $scope.$parent.pages?
            @_items = $scope.$parent.pages

        getItems: () ->
          return @_items


      return new PageControl()
])
