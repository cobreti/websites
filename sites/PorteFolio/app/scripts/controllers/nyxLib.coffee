angular.module('dannyThibaudeauApp')
.controller('nyxLib', ['$scope', '$route', '$location', 'sectionsMgr',
    ($scope, $route, $location, sectionsMgr) ->

      class NyxLibSection
        constructor: ->
          console.log($scope)
          console.log('nyxLib manager section created')

          $scope.nyxdocUrl = 'http://' + $location.host() + ':' + $location.port() + '/nyxdoc'

          @section =
            title: 'Nyx Libraries'

          sectionsMgr.setCurrentSection(@section)

          $scope.$on('$destroy', () =>
            console.log('nyxLib destroyed')
            sectionsMgr.setCurrentSection(null)
          )

      return new NyxLibSection();
  ])
