angular.module('dannyThibaudeauApp')
  .directive('globalMenuItem', ['$location', '$route', '$routeParams', ($location, $route, $routeParams) ->
    restrict: 'EA'
    scope: true
    templateUrl: 'directives/globalMenuItem.html'
    link: ($scope, $element, $attr) ->

      class GlobalMenuItem

        constructor: ->

          @text = $attr.text
          @path = "/#{$attr.route}"

          @updateItemStatus($route.current.originalPath)
          $scope.text = @text

          $scope.$on('$routeChangeSuccess', () =>
            if $route.current.originalPath
              @updateItemStatus($route.current.originalPath)
          )

          $scope.changeRoute = () =>
            $location.path(@path)

        updateItemStatus: (currentRoute) ->

          pathItems = currentRoute.split('/')

          if pathItems.length > 1 && pathItems[1] == $attr.route
            $element.addClass('menu-item-selected')
          else
            $element.removeClass('menu-item-selected')

      return new GlobalMenuItem()
  ])
