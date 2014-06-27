// Generated by CommonJS Everywhere 0.9.7
(function (global) {
  function require(file, parentModule) {
    if ({}.hasOwnProperty.call(require.cache, file))
      return require.cache[file];
    var resolved = require.resolve(file);
    if (!resolved)
      throw new Error('Failed to resolve module ' + file);
    var module$ = {
        id: file,
        require: require,
        filename: file,
        exports: {},
        loaded: false,
        parent: parentModule,
        children: []
      };
    if (parentModule)
      parentModule.children.push(module$);
    var dirname = file.slice(0, file.lastIndexOf('/') + 1);
    require.cache[file] = module$.exports;
    resolved.call(module$.exports, module$, module$.exports, dirname, file);
    module$.loaded = true;
    return require.cache[file] = module$.exports;
  }
  require.modules = {};
  require.cache = {};
  require.resolve = function (file) {
    return {}.hasOwnProperty.call(require.modules, file) ? require.modules[file] : void 0;
  };
  require.define = function (file, fn) {
    require.modules[file] = fn;
  };
  var process = function () {
      var cwd = '/';
      return {
        title: 'browser',
        version: 'v0.10.26',
        browser: true,
        env: {},
        argv: [],
        nextTick: global.setImmediate || function (fn) {
          setTimeout(fn, 0);
        },
        cwd: function () {
          return cwd;
        },
        chdir: function (dir) {
          cwd = dir;
        }
      };
    }();
  require.define('/index.coffee', function (module, exports, __dirname, __filename) {
    var addItem, deleteItem, submitOnEnter;
    addItem = require('/addItem.coffee', module);
    deleteItem = require('/removeItem.coffee', module);
    document.querySelector('.submit').addEventListener('click', addItem, false);
    submitOnEnter = function (ev) {
      if (ev.keyCode === 13)
        return ev.currentTarget.nextElementSibling.click();
    };
    document.querySelector('input').addEventListener('keyup', submitOnEnter, false);
    document.querySelector('ul').addEventListener('click', deleteItem, false);
  });
  require.define('/removeItem.coffee', function (module, exports, __dirname, __filename) {
    var Ajax, deleteHandler, deleteItem, isDeleteLink;
    Ajax = require('/ajax.coffee', module);
    deleteItem = function (linkEl) {
      var item, parentEl;
      parentEl = linkEl.parentElement;
      item = parentEl.querySelector('span').textContent;
      return Ajax.post('/items/delete', { name: item }, function () {
        return parentEl.remove();
      });
    };
    isDeleteLink = function (el) {
      return el.tagName === 'A' && el.className.indexOf('delete-item') !== -1;
    };
    deleteHandler = function (ev) {
      if (isDeleteLink(ev.target))
        return deleteItem(ev.target);
    };
    module.exports = deleteHandler;
  });
  require.define('/ajax.coffee', function (module, exports, __dirname, __filename) {
    var Ajax;
    Ajax = function () {
      var createRequest;
      createRequest = function (method, url, cb) {
        var request;
        request = new XMLHttpRequest;
        request.onload = cb;
        request.open(method, url, true);
        request.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        return request;
      };
      return {
        get: function (url, cb) {
          var request;
          request = createRequest('get', url, cb);
          return request.send();
        },
        post: function (url, payload, cb) {
          var request;
          request = createRequest('post', url, cb);
          request.setRequestHeader('Content-Type', 'application/json');
          return request.send(JSON.stringify(payload));
        }
      };
    };
    module.exports = Ajax();
  });
  require.define('/addItem.coffee', function (module, exports, __dirname, __filename) {
    var addItem, Ajax;
    Ajax = require('/ajax.coffee', module);
    addItem = function (ev) {
      var inputEl, inputValue, itemListEl;
      inputEl = document.querySelector('input');
      inputValue = inputEl.value;
      itemListEl = document.querySelector('ul');
      return Ajax.post('/items/create', { name: inputValue }, function () {
        inputEl.value = '';
        return itemListEl.innerHTML += this.response;
      });
    };
    module.exports = addItem;
  });
  require('/index.coffee');
}.call(this, this));