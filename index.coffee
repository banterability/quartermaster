express = require 'express'
loadConfig = require './lib/config'
userRoutes = require './routes/users'

app = express()
config = loadConfig 'config.json'

app.use require('body-parser')()
app.use require('morgan')('dev')
app.use '/assets', express.static "#{__dirname}/public"

app.set 'view engine', 'mustache'
app.set 'layout', 'layout'
# app.set 'partials', header: 'header'
# app.enable 'view cache'
app.engine 'mustache', require 'hogan-express'

app.get '/', (req, res) ->
  res.render 'index'

app.use '/users', userRoutes

port = process.env.PORT || 5678
app.listen port, ->
  console.log "server up on #{port}…"
