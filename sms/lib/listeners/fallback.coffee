module.exports = (message) ->
  return {intent: 'unknown', content: null, callback: (content, user) ->
    console.log '[fallback handler] -> '
    console.log '---> with content', content
    console.log '---> and user', user
  }