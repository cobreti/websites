angular.module('dannyThibaudeauApp')
  .directive('globalHeader', ['$location', '$route', '$routeParams', ($location, $route, $routeParams) ->
      restrict: 'EA'
      scope: true
      templateUrl: 'directives/globalHeader.html'
      link: ($scope, $element, $attr) ->

        class GlobalHeader

          constructor: ->
            $scope.$on('$routeChangeSuccess', () ->
              $scope.originalPath = $route.current.originalPath
            )
            $scope.originalPath = $route.current.originalPath

            $scope.goHome = () =>
              console.log('going home')
              $location.path('/')
              return

        return new GlobalHeader()
    ])


