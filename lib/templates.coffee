partials =
  list_item: 'list_item'
  stats: 'summary'
  new_item: 'new_item'

module.exports = (app) ->
  app.set 'view engine', 'mustache'
  app.set 'layout', 'layout'
  app.set 'partials', partials
  # app.enable 'view cache'
  app.engine 'mustache', require 'hogan-express'
