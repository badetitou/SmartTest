tests-adding
testAdd
	| onModif el |
	onModif := CORAOnModificationStrategy new.
	self assert: onModif bag isEmpty.
	el := Object new. 
	onModif add: el.
	self assert: onModif bag size equals: 2.
	self assert:( onModif bag includes: el)