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

