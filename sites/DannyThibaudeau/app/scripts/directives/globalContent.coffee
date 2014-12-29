angular.module('dannyThibaudeauApp')
.directive('globalContent', ['sectionsMgr', (sectionsMgr) ->
    scope: true,
    restrict: 'EA'
    templateUrl: '../../directives/globalContent.html'
    link: ($scope, $element, $attr) ->

      class Content
        constructor: ->
          @_sectionMenu = null

          $scope.getClass = () => @getClass()

          sectionsMgr.on('sectionActivated', (section) =>
            if section?
              @_sectionMenu = section.menu
            else
              @_sectionMenu = null;
          )

        getClass: ->
          className = "global-content-default"

          if @_sectionMenu?
            className = "global-content-down"

          return className

      return new Content()
])

