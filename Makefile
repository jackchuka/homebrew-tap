.PHONY: readme
readme:
	./generate-readme.sh

update:
	maltmill -w $$(find Formula -name '*.rb' -type f)

update-cask:
	@echo "Usage: make update-cask CASK=timestack VERSION=0.1.0"
	./update-cask.sh $(CASK) $(VERSION)
