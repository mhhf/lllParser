all: src/lllParser.y
	jison src/lllParser.y

test:
	mocha test

