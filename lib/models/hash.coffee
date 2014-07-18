BaseModel = require './base'

class HashModel extends BaseModel
  get: (field, cb) ->
    @store.hget @key, field, (err, results) ->
      cb err, results

  set: (field, value, cb) ->
    @store.hset @key, field, value, (err, results) ->
      cb err, results

  getAll: (cb) ->
    @store.hgetall @key, (err, results) ->
      cb err, results

module.exports = HashModel
