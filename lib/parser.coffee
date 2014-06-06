{find} = require 'underscore'
addListener = require './listeners/addItem'
removeListener = require './listeners/removeItem'
fallbackListener = require './listeners/fallback'

class Parser
  constructor: (@phrase) ->
    @listeners = [addListener, removeListener, fallbackListener]

  understand: ->
    options = @listeners.map (listener) => listener(@phrase)
    bestOption = find options, (option) -> option

module.exports = Parser

