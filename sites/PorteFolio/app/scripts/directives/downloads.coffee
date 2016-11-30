angular.module('dannyThibaudeauApp')
  .directive('downloads', [
    () ->
      restrict: 'EA'
      scope: {}
      templateUrl: 'directives/downloads.html'
      link: ($scope, $element, $attr) ->

        class Downloads
          constructor: ->

            $.get( "http://www.cds.porte-folio.danny-thibaudeau.ca/Services/ResInfo/#{$attr.item}/#{$attr.platform}")
            .then( (data) =>
              console.log(data)
              $scope.items = data.files

              $scope.items.forEach( (item) =>
                item.platform = $attr.platform
                item.href = "http://www.cds.porte-folio.danny-thibaudeau.ca/Resources/#{item.file}"
              )
            )

        return new Downloads()
  ])
