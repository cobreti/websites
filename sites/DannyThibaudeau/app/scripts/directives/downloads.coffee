angular.module('dannyThibaudeauApp')
  .directive('downloads', [
    () ->
      restrict: 'EA'
      scope: true
      templateUrl: ''
      ($scope, $element, $attr) ->

        class Downloads
          constructor: ->

            $.get( 'http://www.cds.porte-folio.danny-thibaudeau.ca/Services/ResInfo/InterviewManager/Windows', (data) =>
              console.log(data)
            )

        return new Downloads()
  ])
