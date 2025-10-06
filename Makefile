.PHONY: readme
readme:
	./generate-readme.sh

update:
	maltmill -w $$(find Formula -name '*.rb' -type f)
