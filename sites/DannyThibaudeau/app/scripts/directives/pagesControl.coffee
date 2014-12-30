angular.module('dannyThibaudeauApp')
.directive('pagesControl',
  () ->
    restrict: ''
    scope: true
    transclude: true
    templateUrl: 'directives/pagesControl.html'
    controller: ($scope) ->

      class PageControl
        constructor: ->
          console.log('page control created')

          @_items = [
            {
              title: 'Overview'
              href: 'overview'
              selHandler: () => {}
            }
            {
              title: 'Technologies'
              href: 'technologies'
              selHandler: () => {}
            }
            {
              title: 'Download'
              href: 'download'
              selHandler: () => {}
            }
          ]

        getItems: () ->
          return @_items


      return new PageControl()
)
