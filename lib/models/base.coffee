class BaseModel
  constructor: (options) ->
    @attributes = {}

  get: (key) ->
    @attributes[key]

  set: (key, value) ->
    @attributes[key] = value
    response = {}
    response[key] = value
    response

  toJSON: ->
    @attributes


module.exports = BaseModel
