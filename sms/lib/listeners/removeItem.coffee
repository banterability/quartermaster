module.exports = (message) ->
  if matches = message.match /^(?:have|got|bought\s)(.*)/i
    intent = 'remove'
    content = matches[1].trim()
    callback = removeItem
    return {intent, content, callback}
  else
    return false

removeItem = (content, user) ->
  console.log '[remove item handler] -> '
  console.log '---> with content', content
  console.log '---> and user', user
