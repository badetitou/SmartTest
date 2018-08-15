tests-adding
testGet
	| el |
	onModif := SmTTestingStrategyEachModification new.
	el := SmTRunnerTest >> #noop.
	onModif addToElementBag: el.
	self
		assert: (onModif getElementFromBag: SmTRunnerTest >> #testIconForTestResultGreen)
		equals: nil.
	self assert: onModif bag size equals: 1.
	self
		assert: (onModif getElementFromBag: SmTRunnerTest >> #testIconForTestResultGreen)
		equals: nil.
	self assert: (onModif getElementFromBag: el) equals: el.
	self assert: onModif bag size equals: 0.
	self assert: (onModif getElementFromBag: el) equals: nil