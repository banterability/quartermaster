HULK=./node_modules/.bin/hulk

templates:
	$(HULK) views/list_item.mustache > public/templates.js

.PHONY: templates
