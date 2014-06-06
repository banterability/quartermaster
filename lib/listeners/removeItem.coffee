module.exports = (message) ->
  if matches = message.match /^(?:have|got|bought\s)(.*)/i
    intent = 'remove'
    content = matches[1].trim()
    return {intent, content}
  else
    return false
