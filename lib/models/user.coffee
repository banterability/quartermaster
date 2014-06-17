{HashModel} = require './base'

class User extends HashModel
  isActive: (cb) ->
    @get 'active', (err, results) ->
      cb err, results == 'true'

module.exports = User
