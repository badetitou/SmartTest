tests-adding
testAdd
	| onModif el |
	onModif := SmTTestingStrategyEachModification new.
	self assert: onModif bag isEmpty.
	el := SmTRunnerTest >> #noop.
	onModif addToElementBag: el.
	self assert: onModif bag size equals: 1.
	self assert: (onModif bag includes: el)