.PHONY: check
check:
	diff ~/.config/mimeapps.list config/mimeapps.list

.PHONY: update
update:
	mkrc ~/.config/mimeapps.list
