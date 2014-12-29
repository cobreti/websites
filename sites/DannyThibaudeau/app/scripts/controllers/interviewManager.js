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
            title: 'Interview Manager',
            menu: [
              {
                title: 'Overview',
                href: 'overview',
                selHandler: (function(_this) {
                  return function() {
                    return {};
                  };
                })(this)
              }, {
                title: 'Technologies',
                href: 'technologies',
                selHandler: (function(_this) {
                  return function() {
                    return {};
                  };
                })(this)
              }, {
                title: 'Download',
                href: 'download',
                selHandler: (function(_this) {
                  return function() {
                    return {};
                  };
                })(this)
              }
            ]
          };
          sectionsMgr.setCurrentSection(this.section);
          $scope.$on('$destroy', (function(_this) {
            return function() {
              console.log('InterviewManager destroyed');
              return sectionsMgr.setCurrentSection(null);
            };
          })(this));
        }

        InterviewManagerSection.prototype.onItemSelected = function(idx) {
          return console.log("page selected " + idx);
        };

        return InterviewManagerSection;

      })();
      return new InterviewManagerSection();
    }
  ]);

}).call(this);

//# sourceMappingURL=interviewManager.js.map
