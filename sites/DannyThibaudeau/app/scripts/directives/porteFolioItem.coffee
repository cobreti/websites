angular.module('dannyThibaudeauApp')
  .directive('porteFolioItem', ['$compile', ($compile) ->
    scope: true
    restrict: 'EA'
    templateUrl: 'directives/porteFolioItem.html'
    link: ($scope, $element, $attr) ->

      class PorteFolioItem
        constructor: ->
          @title = $attr.title
          @height = 400
          $scope.title = @title
          $scope.img = $attr.img

          $scope.updateLayout = () =>
            @updateLayout()

          $scope.descStyle = () =>
            @descStyle()

          descElem = $element.find('.porte-folio-item-description')
          desc = $compile("<ng-include onload=\"updateLayout()\" src=\"#{$attr.description}\"></ng-include>")($scope)
          descElem.append(desc)

        updateLayout: () ->
          imgDiv = $element.find('.porte-folio-item-image')
          img = imgDiv.find('img')
          descDiv = $element.find('.porte-folio-item-description')

          imgHeight = img.height()
          descHeight = descDiv.height()

          @height = Math.max(img.height(), descDiv.height())

          console.log("imgHeight : #{imgHeight} -- descHeight : #{descHeight}")
          console.log("height : #{@height}")

        descStyle: () ->
          {
            height: "200px"
          }


      return new PorteFolioItem()
  ])
