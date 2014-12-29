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

            sectionsMgr.on('sectionActivated', (section) =>
              @setMenuPosition(section)
            )

            @setMenuPosition(sectionsMgr.getCurrentSection())

          updateFollowingRouteChange: (current) ->

            @setMenuPosition()

          setMenuPosition: (section) ->
#            section = sectionsMgr.getCurrentSection()

            if section?
              @globalMenuElm.removeClass('global-menu-bottom')
              @globalMenuElm.addClass('global-menu-top')
            else
              @globalMenuElm.addClass('global-menu-bottom')
              @globalMenuElm.removeClass('global-menu-top')

        return new GlobalMenu()
  ])
