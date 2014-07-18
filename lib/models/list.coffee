BaseModel = require './base'

class ListModel extends BaseModel
  push: (item, cb) ->
    @store.rpush @key, item, (err, results) ->
      cb err, results

  pop: (cb) ->
    @store.rpop @key, (err, results) ->
      cb err, results

  getAll: (cb) ->
    @store.lrange @key, 0, -1, (err, results) ->
      cb err, results

  remove: (item, cb) ->
    @store.lrem @key, 0, item, (err, results) ->
      cb err, results

module.exports = ListModel
