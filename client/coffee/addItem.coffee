Ajax = require 'ajax'

addItem = (ev) ->
  inputEl = document.querySelector 'input'
  inputValue = inputEl.value
  itemListEl = document.querySelector 'ul'

  Ajax.post '/items/create', {name: inputValue}, ->
    inputEl.value = ''
    itemListEl.innerHTML += @response

module.exports = addItem
