angular.module('dannyThibaudeauApp')
  .directive('porteFolioItem', ['$compile', '$window', ($compile, $window) ->
    scope: true
    restrict: 'EA'
    templateUrl: 'directives/porteFolioItem.html'
    link: ($scope, $element, $attr) ->

      class PorteFolioItem
        constructor: ->
          @title = $attr.title
          @height = null
          @width = null
          $scope.title = @title
          $scope.img = $attr.img

          $scope.updateLayout = () =>
            @updateLayout()

          $scope.descStyle = () =>
            @descStyle()

          $scope.bkgndImage = () =>
            @bkgndImage()

          angular.element($window).bind('resize', () =>
            @updateLayout()
            $scope.$apply()
          )

          descElem = $element.find('.porte-folio-item-description')
          desc = $compile("<ng-include onload=\"updateLayout()\" src=\"#{$attr.description}\"></ng-include>")($scope)
          descElem.append(desc)

        updateLayout: () ->
          imgDiv = $element.find('.porte-folio-item-image')
          descDiv = $element.find('.porte-folio-item-description')

          descHeight = descDiv.height()

          width = $element.width() - imgDiv.outerWidth(true) - 100

          if width != @width
            @width = width
            setTimeout( () =>
              @updateLayout()
              $scope.$apply()
            , 100 )

          @height = descHeight

        descStyle: () ->
          if @height && @width
            style =
              'width': @width + 'px'

          return style


        bkgndImage: () ->
          style =
            'background-image': "url('#{$attr.img}')"

          if @height
            style['height'] = @height + 'px'

          return style


      return new PorteFolioItem()
  ])
