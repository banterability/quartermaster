window.Quartermaster = {};

var Ajax = {
  get: function(url, cb) {
    var request = this.createRequest('get', url, cb);
    return request.send();
  },
  post: function(url, data, cb) {
    var request = this.createRequest('post', url, cb);
    request.setRequestHeader('Content-Type', 'application/json');
    return request.send(JSON.stringify(data));
  },
  createRequest: function(method, url, cb) {
    var request = new XMLHttpRequest();
    request.onload = cb;
    request.open(method, url, true);
    request.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    return request;
  }
};

var addItem = function(ev){
  var inputEl = document.querySelector('input');
  var inputValue = inputEl.value;
  console.log({el: inputEl, value: inputValue});
  Ajax.post('/items/create', {name: inputValue}, function(){
    inputEl.value = '';
    var sandbox = document.createElement('div');
    sandbox.innerHTML = templates.list_item.render({name: inputValue});
    newItem = sandbox.children[0];
    document.querySelector('ul').appendChild(newItem);
  });
};

document.querySelector('.submit').addEventListener('click', addItem, false);

// Detect enter key in input box
document.querySelector('input').addEventListener('keyup', function(ev){
  if(ev.keyCode === 13){
    ev.currentTarget.nextElementSibling.click();
  }
  return false;
}, false);

var deleteItem = function(linkEl){
  var parentEl = linkEl.parentElement;
  var itemName = parentEl.querySelector('span').textContent;
  Ajax.post('/items/delete', {name: itemName}, function(){
    parentEl.remove();
  });
};

var isDeleteLink = function(el){
  return (el.tagName === 'A') && (el.className.indexOf('delete-item') !== -1);
};

// Listen "live" for delete events
document.querySelector('ul').addEventListener('click', function(ev){
  if(isDeleteLink(ev.target)){
    deleteItem(ev.target);
    return true;
  }
  return false;
}, false);
