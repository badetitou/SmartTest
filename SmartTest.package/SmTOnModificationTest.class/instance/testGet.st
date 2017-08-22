tests-adding
testGet
	| onModif el |
	onModif := SmTOnModificationStrategy new.
	el := (SmTRunnerTest>>#noop).
	onModif add: el.
	onModif add: el. 
	
	self assert: (onModif get: (SmTRunnerTest>>#testIconForTestResultGreen)) equals: nil.
	self assert: (onModif get: el) equals: el.
	self assert: (onModif get: el) equals: el.
	self assert: onModif bag size equals: 2.
	self assert: (onModif get: (SmTRunnerTest>>#testIconForTestResultGreen)) equals: nil.
	self assert: (onModif get: el) equals: el.
	self assert: (onModif get: el) equals: el.
	self assert: onModif bag size equals: 0.
	self assert: (onModif get: el) equals: nil