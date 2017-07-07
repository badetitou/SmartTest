tests-adding
testGet
	| onModif el |
	onModif := CORAOnModificationStrategy new.
	el := Object new.
	onModif add: el.
	onModif add: el.
	self assert: (onModif get: Object new) equals: nil.
	self assert: (onModif get: el) equals: el.
	self assert: (onModif get: el) equals: el.
	self assert: onModif bag size equals: 2.
	self assert: (onModif get: Object new) equals: nil.
	self assert: (onModif get: el) equals: el.
	self assert: (onModif get: el) equals: el.
	self assert: onModif bag size equals: 0.
	self assert: (onModif get: el) equals: nil