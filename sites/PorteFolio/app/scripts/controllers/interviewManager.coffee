angular.module('dannyThibaudeauApp')
.controller('interviewManager', ['$scope', '$route', '$location', 'sectionsMgr',
    ($scope, $route, $location, sectionsMgr) ->

      class InterviewManagerSection
        constructor: ->
          console.log($scope)
          console.log('interview manager section created')

          @section =
            title: 'Interview Manager'

          $scope.pages = [
            {
              title: 'Overview'
              url: 'fragments/interviewManager/overview.html'
            }
            {
              title: 'Technologies'
              url: 'fragments/interviewManager/technologies.html'
            }
            {
              title: 'Download'
              url: 'fragments/interviewManager/download.html'
            }
          ]

          sectionsMgr.setCurrentSection(@section)

          $scope.$on('$destroy', () =>
            console.log('InterviewManager destroyed')
            sectionsMgr.setCurrentSection(null)
          )

        onItemSelected: (idx) ->
          console.log("page selected #{idx}")
          $scope.currentPage = $scope.pages[idx]

      return new InterviewManagerSection();
  ])
