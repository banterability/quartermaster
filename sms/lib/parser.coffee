{find} = require 'underscore'
addListener = require './listeners/addItem'
removeListener = require './listeners/removeItem'
fallbackListener = require './listeners/fallback'

class Parser
  constructor: (@phrase) ->
    @listeners = [addListener, removeListener, fallbackListener]

  understand: ->
    options = @listeners.map (listener) => listener(@phrase)
    console.log 'options', options
    bestOption = find options, (option) -> option
    console.log 'best option', bestOption
    bestOption

module.exports = Parser

