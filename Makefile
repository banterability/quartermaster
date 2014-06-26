usage:
	@echo ''
	@echo 'Task               : Description'
	@echo '--------------     : --------------'
	@echo 'make client        : Compile & package client JS'
	@echo 'make server        : Start server on port 5678'
	@echo 'make watch-client  : Recompile client JS on file change'
	@echo 'make watch-server  : Reload server on file change'
	@echo ''

.PHONY: client server watch-client watch-server

client:
	./node_modules/.bin/cjsify -r client/coffee index.coffee -o public/app.js

watch-client:
	./node_modules/.bin/cjsify -w -r client/coffee index.coffee -o public/app.js
