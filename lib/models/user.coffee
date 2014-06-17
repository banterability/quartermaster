BaseModel = require './base'

class User extends BaseModel
  isActive: ->
    @attributes.active || false

module.exports = User
