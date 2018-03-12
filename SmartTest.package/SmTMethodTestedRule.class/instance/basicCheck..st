running
basicCheck: anEntity
	^ (super basicCheck: anEntity)
		and: [ (anEntity isKindOf: CompiledMethod) and: [ self class methodActivated ] ]