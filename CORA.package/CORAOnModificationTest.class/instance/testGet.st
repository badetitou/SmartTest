tests-adding
testGet
	| onModif el |

	onModif := CORAOnModificationStrategy new.
	el := (CORARunnerTest>>#noop).
	onModif add: el.
	onModif add: el. 
	
	self assert: (onModif get: (CORARunnerTest>>#testIconForTestResultGreen)) equals: nil.
	self assert: (onModif get: el) equals: el.
	self assert: (onModif get: el) equals: el.
	self assert: onModif bag size equals: 2.
	self assert: (onModif get: (CORARunnerTest>>#testIconForTestResultGreen)) equals: nil.
	self assert: (onModif get: el) equals: el.
	self assert: (onModif get: el) equals: el.
	self assert: onModif bag size equals: 0.
	self assert: (onModif get: el) equals: nil