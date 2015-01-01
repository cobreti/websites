angular.module('dannyThibaudeauApp')
.controller('nyxTraceViewer', ['$scope', '$route', '$location', 'sectionsMgr',
    ($scope, $route, $location, sectionsMgr) ->

      class InterviewManagerSection
        constructor: ->
          console.log($scope)
          console.log('nyxTraceViewer manager section created')

          @section =
            title: 'Interview Manager'

          $scope.pages = [
            {
              title: 'Overview'
              url: 'fragments/NyxTraceViewer/overview.html'
            }
            {
              title: 'Technologies'
              url: 'fragments/NyxTraceViewer/technologies.html'
            }
#            {
#              title: 'Download'
#              url: 'fragments/NyxTraceViewer/download.html'
#            }
          ]

          sectionsMgr.setCurrentSection(@section)

          $scope.$on('$destroy', () =>
            console.log('nyxTraceViewer destroyed')
            sectionsMgr.setCurrentSection(null)
          )

        onItemSelected: (idx) ->
          console.log("page selected #{idx}")
          $scope.currentPage = $scope.pages[idx]

      return new InterviewManagerSection();
  ])
