express = require 'express'
fs = require 'fs'

config = JSON.parse fs.readFileSync 'config.json', encoding: 'utf-8'

app = express()

app.use require('body-parser')()
app.use require('morgan')('dev')

app.set 'view engine', 'mustache'
app.set 'layout', 'layout'
# app.set 'partials', header: 'header'
# app.enable 'view cache'
app.engine 'mustache', require 'hogan-express'

app.get '/', (req, res) ->
  res.render 'index'

app.get '/join', (req, res) ->
  res.render 'new_user'

app.post '/welcome', (req, res) ->
  console.log 'body', req.body
  res.locals =
    title: 'Welcome, new best friend!'
  res.render 'thanks'

port = process.env.PORT || 5678
app.listen port, ->
  console.log "server up on #{port}…"
