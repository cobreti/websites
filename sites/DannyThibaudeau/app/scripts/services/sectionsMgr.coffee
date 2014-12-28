angular.module('dannyThibaudeauApp')
  .factory('sectionsMgr', ['$route', '$location', ($route, $location) ->

    class ActiveSection
      constructor: ->

      setCurrentSection: (section) ->
        @_currentSection = section

      getCurrentSection: ->
        return @_currentSection

    return new ActiveSection()
  ])
