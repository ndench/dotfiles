.PHONY: check
check:
	diff ~/.config/mimeapps.list tag-new-dotfiles/config/mimeapps.list

.PHONY: update
update:
	mkrc -t new-dotfiles ~/.config/mimeapps.list
