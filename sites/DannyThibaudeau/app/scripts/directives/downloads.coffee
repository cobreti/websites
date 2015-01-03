angular.module('dannyThibaudeauApp')
  .directive('downloads', [
    () ->
      restrict: 'EA'
      scope: true
      templateUrl: ''
      ($scope, $element, $attr) ->

        class Downloads
          constructor: ->

            @cdsApi = new cdsApi();
            @cdsApi.getDownloads('InterviewManager', 'Windows').then( (data) =>
              console.log(data)
            )

        return new Downloads()
  ])
