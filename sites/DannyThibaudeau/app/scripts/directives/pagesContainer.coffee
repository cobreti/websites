angular.module('dannyThibaudeauApp')
.directive('pagesContainer', [ '$compile',
  ($compile) ->
    require: '^pages-control'
    restrict: 'EA'
    scope: false
    templateUrl: 'directives/pagesContainer.html'
    link: ($scope, $element, $attr) ->

      class PagesContainer
        constructor: ->

          console.log('pages container created')
          console.log($scope.$parent.activePage)
          root = $element.find('.pages-root')

          $scope.$parent.pages.forEach( (page) =>
            childScope = $scope.$new()
            childScope.page = page
            pageElement = $compile("<div page></div>")(childScope)
            root.append(pageElement)
          )

      return new PagesContainer()
])
