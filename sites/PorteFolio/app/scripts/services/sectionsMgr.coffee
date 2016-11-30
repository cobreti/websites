angular.module('dannyThibaudeauApp')
  .factory('sectionsMgr', ['$route', '$location', ($route, $location) ->

    class ActiveSection
      constructor: ->
        @_events =
          sectionActivated: []
          sectionDeactivated: []

      setCurrentSection: (section) ->
        @_currentSection = section

        @_events.sectionActivated.forEach( (fct) ->
          fct(section)
        )

      getCurrentSection: ->
        return @_currentSection

      on: (eventId, fct) ->
        @_events[eventId].push(fct)

    return new ActiveSection()
  ])
