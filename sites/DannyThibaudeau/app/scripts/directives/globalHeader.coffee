angular.module('dannyThibaudeauApp').
  directive('globalHeader', () ->
    restrict: 'E'
    templateUrl: 'directives/globalHeader.html'
    link: () ->
      test = "test"
  )
