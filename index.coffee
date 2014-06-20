express = require 'express'
app = express()

app.use require('body-parser')()
app.use require('morgan')('dev')
app.use '/assets', express.static "#{__dirname}/public" unless app.get 'env' == 'production'

app.set 'view engine', 'mustache'
app.set 'layout', 'layout'
# app.set 'partials', header: 'header'
# app.enable 'view cache'
app.engine 'mustache', require 'hogan-express'

app.get '/', (req, res) ->
  res.render 'index'

port = process.env.PORT || 5678
app.listen port, ->
  console.log "#{app.get 'env'} server up on #{port}…"
