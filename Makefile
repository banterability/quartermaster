usage:
	@echo ''
	@echo 'Task              : Description'
	@echo '--------------    : --------------'
	@echo 'make client       : Compile & package client JS'
	@echo 'make client-dev   : Recompile client JS on file change'
	@echo 'make server       : Start server on port 5678'
	@echo 'make server-dev   : Start auto-reloading server on port 5678'
	@echo ''

.PHONY: client client-dev server server-dev

client:
	./node_modules/.bin/cjsify -r client/coffee index.coffee -o public/app.js

client-dev:
	./node_modules/.bin/cjsify -w -r client/coffee index.coffee -o public/app.js

server:
	npm start

server-dev:
	node-dev index.coffee
