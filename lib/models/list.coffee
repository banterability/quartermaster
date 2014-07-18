BaseModel = require './base'

class ListModel extends BaseModel
  push: (item, cb) ->
    @store.rpush @key, item, cb

  pop: (cb) ->
    @store.rpop @key, cb

  getAll: (cb) ->
    @store.lrange @key, 0, -1, cb

  remove: (item, cb) ->
    @store.lrem @key, 0, item, cb

module.exports = ListModel
