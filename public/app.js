window.Quartermaster = {};

var getRequest = function(method, url, onload){
  var request = new XMLHttpRequest();
  request.onload = onload;
  request.open(method, url, true);
  return request;
}

var ajaxGet = function(url, cb){
  var request = getRequest('get', url, cb);
  request.send();
}
var ajaxPost = function(url, data, cb){
  var request = getRequest('post', url, cb);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(data));
}

var addItem = function(ev){
  var inputEl = document.querySelector('input');
  var inputValue = inputEl.value;
  console.log({el: inputEl, value: inputValue});
  ajaxPost('/items/create', {name: inputValue}, function(){
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
  ajaxPost('/items/delete', {name: itemName}, function(){
    parentEl.remove();
  });
};

var addDeleteListener = function(el){
  el.addEventListener('click', deleteItem, false);
};

[].forEach.call(document.querySelectorAll('.delete-item'), function(node){
  addDeleteListener(node);
});
