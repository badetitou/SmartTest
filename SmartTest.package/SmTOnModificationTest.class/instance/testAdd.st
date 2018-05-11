tests-adding
testAdd
	| onModif el |
	onModif := SmTOnModificationStrategy new.
	self assert: onModif bag isEmpty.
	el := (SmTRunnerTest>>#noop). 
	onModif add: el. 
	self assert: onModif bag size equals: 1.
	self assert:( onModif bag includes: el)
	