BaseModel = require './base'

class User extends BaseModel
  isActive: (cb) ->
    @get 'active', (err, results) ->
      cb err, results == 'true'

module.exports = User
