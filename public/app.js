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
    var newItem = document.createElement('li');

    var newItemText = document.createElement('span');
    newItemText.textContent = inputValue;

    var newItemDeleteLink = document.createElement('a');
    newItemDeleteLink.href = 'javascript:void(0);'
    newItemDeleteLink.classList.add('delete-item');
    newItemDeleteLink.textContent = 'x';
    addDeleteListener(newItemDeleteLink);

    newItem.appendChild(newItemText);
    newItem.appendChild(newItemDeleteLink);

    document.querySelector('ul').appendChild(newItem);
  });
}

document.querySelector('.submit').addEventListener('click', addItem, false);

var deleteItem = function(ev){
  var parentEl = ev.currentTarget.parentElement;
  var itemName = parentEl.querySelector('span').textContent;
  Ajax.post('/items/delete', {name: itemName}, function(){
    parentEl.remove();
  });
};

var addDeleteListener = function(el){
  el.addEventListener('click', deleteItem, false);
};

[].forEach.call(document.querySelectorAll('.delete-item'), function(node){
  addDeleteListener(node);
});
