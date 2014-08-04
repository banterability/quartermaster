addItem = require 'addItem'
deleteItem = require 'removeItem'

init = (->
    # listen for adds
    document.querySelector('.submit').addEventListener 'click', addItem, false

    # fire add event on "enter" keypress in input box
    submitOnEnter = (ev) ->
      ev.currentTarget.nextElementSibling.click() if ev.keyCode == 13

    document.querySelector('input').addEventListener 'keyup', submitOnEnter, false

    # listen 'live' for deletes
    document.querySelector('ul').addEventListener 'click', deleteItem, false
)()
