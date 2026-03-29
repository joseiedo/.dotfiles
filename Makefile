.PHONY: brew npm all

all: brew npm

brew:
	brew bundle --file=BrewFile

npm:
	npm install -g @anthropic-ai/claude-code @tobilu/qmd
