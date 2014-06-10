class BaseModel
  constructor: (options) ->
    @attributes = {}

  get: (key) ->
    @attributes[key]

  set: (key, value) ->
    @attributes[key] = value
    (output = {})[key] = value
    output

  toJSON: ->
    @attributes


module.exports = BaseModel
