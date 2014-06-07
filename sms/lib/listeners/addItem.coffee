module.exports = (message) ->
  if matches = message.match /^(?:need|get|buy\s)(.*)/i
    intent = 'add'
    content = matches[1].trim()
    callback = addItem
    return {intent, content, callback}
  else
    return false

addItem = (content, user) ->
  console.log '[add item handler] -> '
  console.log '---> with content', content
  console.log '---> and user', user
