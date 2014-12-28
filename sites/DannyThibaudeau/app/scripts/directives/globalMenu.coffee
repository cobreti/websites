angular.module('dannyThibaudeauApp')
  .directive('globalMenu', ['$route', '$routeParams', ($route, $routeParams) ->
    restrict: 'EA'
    scope: true
    templateUrl: 'directives/globalMenu.html'
    link: ($scope, $element, $attributes) ->

      class GlobalMenu
        constructor: ->

          @globalMenuElm = $element.find('.global-menu')

          $scope.$on('$routeChangeSuccess', () =>
            if $route.current.originalPath
              @updateFollowingRouteChange()
          )

        updateFollowingRouteChange: ->

          pathItems = $route.current.originalPath.split('/')

          if pathItems.length > 2 && !@globalMenuElm.hasClass('global-menu-top')
            @globalMenuElm.removeClass('global-menu-bottom')
            @globalMenuElm.addClass('global-menu-top')

          if pathItems.length < 3 && @globalMenuElm.hasClass('global-menu-top')
            @globalMenuElm.addClass('global-menu-bottom')
            @globalMenuElm.removeClass('global-menu-top')

      return new GlobalMenu()
  ])
