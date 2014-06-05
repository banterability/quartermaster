class Parser
  constructor: (@phrase) ->

  understand: ->
    intent = content = undefined
    if matches = @phrase.match /^(?:need|get|buy\s)(.*)/i
      intent = 'add'
      content = matches[1].trim()
    else if matches = @phrase.match /^(?:have|got|bought\s)(.*)/i
      intent = 'remove'
      content = matches[1].trim()

    {intent, content}

module.exports = Parser

