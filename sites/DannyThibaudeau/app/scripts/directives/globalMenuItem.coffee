angular.module('dannyThibaudeauApp')
  .directive('globalMenuItem', ['$location', '$route', '$routeParams', ($location, $route, $routeParams) ->
    restrict: 'EA'
    scope: true
    templateUrl: 'directives/globalMenuItem.html'
    link: ($scope, $element, $attr) ->

      class GlobalMenuItem

        constructor: ->

          @text = $attr.text

          @updateItemStatus($route.current.originalPath)
          $scope.text = @text
          console.log($attr)

          $scope.$on('$routeChangeSuccess', () =>
            @updateItemStatus($route.current.originalPath)
          )

          $scope.changeRoute = () =>
            $location.path($attr.route)

        updateItemStatus: (currentRoute) ->
          if currentRoute == $attr.route
            $element.addClass('menu-item-selected')
          else
            $element.removeClass('menu-item-selected')

      return new GlobalMenuItem()
  ])
