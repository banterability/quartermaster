module.exports = (message) ->
  if matches = message.match /^(?:need|get|buy\s)(.*)/i
    intent = 'add'
    content = matches[1].trim()
    return {intent, content}
  else
    return false
