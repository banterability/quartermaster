BaseModel = require './base'

class HashModel extends BaseModel
  get: (field, cb) ->
    @store.hget @key, field, cb

  set: (field, value, cb) ->
    @store.hset @key, field, value, cb

  getAll: (cb) ->
    @store.hgetall @key, cb

module.exports = HashModel
