angular.module('dannyThibaudeauApp')
  .directive('porteFolioItem', ['$compile', '$window', '$location', 'sectionsMgr',
    ($compile, $window, $location, sectionsMgr) ->
      scope: true
      restrict: 'EA'
      templateUrl: 'directives/porteFolioItem.html'
      link: ($scope, $element, $attr) ->

        class PorteFolioItem
          constructor: ->
            @title = $attr.title
            @height = null
            @width = null
            @sectionId = $attr.sectionId;
            $scope.title = @title
            $scope.img = $attr.img
            $scope.href = $attr.href;

            $scope.updateLayout = () =>
              @updateLayout()

            $scope.descStyle = () =>
              @descStyle()

            $scope.bkgndImage = () =>
              @bkgndImage()

            $scope.onTitleClicked = () =>
              @onTitleClicked()

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

          onTitleClicked: () ->
#            sectionsMgr.activate(@sectionId)
            $location.path($scope.href)

        return new PorteFolioItem()
  ])
