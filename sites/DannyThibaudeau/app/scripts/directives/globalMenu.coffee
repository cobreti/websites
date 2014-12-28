angular.module('dannyThibaudeauApp')
  .directive('globalMenu', ['$route', '$routeParams', 'sectionsMgr',
    ($route, $routeParams, sectionsMgr) ->
      restrict: 'EA'
      scope: true
      templateUrl: 'directives/globalMenu.html'
      link: ($scope, $element, $attributes) ->

        class GlobalMenu
          constructor: ->

            @globalMenuElm = $element.find('.global-menu')

            $scope.$on('$routeChangeSuccess', () =>
              if $route.current.originalPath
                @updateFollowingRouteChange($route.current)
            )

            @setMenuPosition()

          updateFollowingRouteChange: (current) ->

            @setMenuPosition()

          setMenuPosition: () ->
            section = sectionsMgr.getCurrentSection()

            if section?
              @globalMenuElm.removeClass('global-menu-bottom')
              @globalMenuElm.addClass('global-menu-top')
            else
              @globalMenuElm.addClass('global-menu-bottom')
              @globalMenuElm.removeClass('global-menu-top')

        return new GlobalMenu()
  ])
