angular.module('dannyThibaudeauApp')
  .directive('globalHeader', ['$location', '$route', 'sectionsMgr',
    ($location, $route, sectionsMgr) ->
      restrict: 'EA'
      scope: true
      templateUrl: 'directives/globalHeader.html'
      link: ($scope, $element, $attr) ->

        class GlobalHeader

          constructor: ->

            @sectionTitleElm = $element.find('.section-title')

            sectionsMgr.on('sectionActivated', (section) =>
              if section?
                @sectionTitleElm.text(section.title)
                @sectionTitleElm.removeClass('section-title-hidden')
                @sectionTitleElm.addClass('section-title-visible')
              else
                @sectionTitleElm.removeClass('section-title-visible')
                @sectionTitleElm.addClass('section-title-hidden')
            )

            $scope.$on('$routeChangeSuccess', () =>
              $scope.originalPath = $route.current.originalPath
            )

            $scope.originalPath = $route.current.originalPath

            $scope.goHome = () =>
              console.log('going home')
              $location.path('/')
              return

        return new GlobalHeader()
    ])


