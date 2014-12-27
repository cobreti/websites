angular.module('dannyThibaudeauApp')
  .directive('globalMenu', ['$route', '$routeParams', ($route, $routeParams) ->
    restrict: 'EA'
    scope: true
    templateUrl: 'directives/globalMenu.html'
    link: (scope, element, attributes) ->
      console.log(attributes)
      return
  ])
