angular.module('dannyThibaudeauApp')
.controller('nyxLib', ['$scope', '$route', '$location', 'sectionsMgr',
    ($scope, $route, $location, sectionsMgr) ->

      class InterviewManagerSection
        constructor: ->
          console.log($scope)
          console.log('nyxLib manager section created')

          @section =
            title: 'Nyx Libraries'

          sectionsMgr.setCurrentSection(@section)

          $scope.$on('$destroy', () =>
            console.log('nyxLib destroyed')
            sectionsMgr.setCurrentSection(null)
          )

      return new InterviewManagerSection();
  ])
