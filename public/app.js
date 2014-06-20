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
