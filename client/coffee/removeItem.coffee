Ajax = require 'ajax'

deleteItem = (linkEl) ->
  parentEl = linkEl.parentElement
  item = parentEl.querySelector('span').textContent

  Ajax.post '/items/delete', {name: item}, ->
    parentEl.remove()

isDeleteLink = (el) ->
  (el.tagName == 'A') && (el.classList.contains 'delete-item')

deleteHandler = (ev) ->
  deleteItem(ev.target) if isDeleteLink ev.target

module.exports = deleteHandler
