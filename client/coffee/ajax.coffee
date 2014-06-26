Ajax =
  get: (url, cb) ->
    request = @createRequest 'get', url, cb
    request.send()

  post: (url, payload, cb) ->
    request = @createRequest 'post', url, cb
    request.setRequestHeader 'Content-Type', 'application/json'
    request.send JSON.stringify(payload)

  createRequest: (method, url, cb) ->
    request = new XMLHttpRequest()
    request.onload = cb
    request.open method, url, true
    request.setRequestHeader 'X-Requested-With', 'XMLHttpRequest'
    request

module.exports = Ajax
