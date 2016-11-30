angular.module('dannyThibaudeauApp')
.directive('page', ['$compile',
  ($compile) ->
    restrict: 'EA'
    scope: true
    templateUrl: 'directives/page.html'
    link: ($scope, $element, $attr) ->

      class Page
        constructor: ->
          console.log('page created')
          console.log($scope.$parent.activePage)
          console.log($scope.page)

          if $scope.page.url?
            @loadPage()

          $scope.active = false

          $scope.$parent.$watch('activePage', () =>
            console.log("active page changed - #{$scope.page.url} - #{$scope.$parent.activePage.url}")

            if $scope.page.url? && $scope.$parent.activePage.url?
              $scope.active = $scope.page.url == $scope.$parent.activePage.url
              console.log("active = #{$scope.active}")
            else
              $scope.active = false
          )

        loadPage: ->
          url = $scope.page.url
          content = $compile("<ng-include src=\"'#{url}'\"></ng-include>")($scope)
          $element.find('.page-root').append(content)

      return new Page()
])
