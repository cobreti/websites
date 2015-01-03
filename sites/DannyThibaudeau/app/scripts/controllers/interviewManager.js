// Generated by CoffeeScript 1.8.0
(function() {
  angular.module('dannyThibaudeauApp').controller('interviewManager', [
    '$scope', '$route', '$location', 'sectionsMgr', function($scope, $route, $location, sectionsMgr) {
      var InterviewManagerSection;
      InterviewManagerSection = (function() {
        function InterviewManagerSection() {
          console.log($scope);
          console.log('interview manager section created');
          this.section = {
            title: 'Interview Manager'
          };
          $scope.pages = [
            {
              title: 'Overview',
              url: 'fragments/interviewManager/overview.html'
            }, {
              title: 'Technologies',
              url: 'fragments/interviewManager/technologies.html'
            }, {
              title: 'Download',
              url: 'fragments/interviewManager/download.html'
            }
          ];
          sectionsMgr.setCurrentSection(this.section);
          $scope.$on('$destroy', (function(_this) {
            return function() {
              console.log('InterviewManager destroyed');
              return sectionsMgr.setCurrentSection(null);
            };
          })(this));
        }

        InterviewManagerSection.prototype.onItemSelected = function(idx) {
          console.log("page selected " + idx);
          return $scope.currentPage = $scope.pages[idx];
        };

        return InterviewManagerSection;

      })();
      return new InterviewManagerSection();
    }
  ]);

}).call(this);

//# sourceMappingURL=interviewManager.js.map
