accessing
basicCheck: anEntity
	^ (super basicCheck: anEntity)
		and: [ (anEntity isKindOf: CompiledMethod) and: [ self class isMethodActivated and: [ (self class getElementFromBag: anEntity) isNotNil ] ] ]