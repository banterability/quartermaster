express = require 'express'
router = express.Router()

router.get '/create', (req, res) ->
  res.render 'users/create'

router.post '/create', (req, res) ->
  console.log 'body', req.body
  res.locals =
    title: 'Welcome, new best friend!'
  res.render 'users/finish'

module.exports = router
