angular.module('dannyThibaudeauApp')
.controller('interviewManager', ['$scope', '$route', '$location', 'sectionsMgr',
    ($scope, $route, $location, sectionsMgr) ->

      class InterviewManagerSection
        constructor: ->
          console.log($scope)
          console.log('interview manager section created')

          @section =
            title: 'Interview Manager'
            menu: [
              {
                title: 'Overview'
                href: 'overview'
                selHandler: () => {}
              }
              {
                title: 'Technologies'
                href: 'technologies'
                selHandler: () => {}
              }
              {
                title: 'Download'
                href: 'download'
                selHandler: () => {}
              }
            ]


          sectionsMgr.setCurrentSection(@section)

          $scope.$on('$destroy', () =>
            console.log('InterviewManager destroyed')
            sectionsMgr.setCurrentSection(null)
          )

        onItemSelected: (idx) ->
          console.log("page selected #{idx}")

      return new InterviewManagerSection();
  ])
