angular.module('dannyThibaudeauApp')
.controller('interviewManager', ['$scope', 'sectionsMgr',
    ($scope, sectionsMgr) ->

      class InterviewManagerSection
        constructor: ->
          console.log($scope)
          console.log('interview manager section created')

          @section =
            title: 'Interview Manager'

          sectionsMgr.setCurrentSection(@section)

          $scope.$on('$destroy', () =>
            console.log('InterviewManager destroyed')
            sectionsMgr.setCurrentSection(null)
          )

      return new InterviewManagerSection();
  ])
