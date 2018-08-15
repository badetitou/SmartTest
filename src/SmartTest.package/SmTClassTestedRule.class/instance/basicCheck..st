running
basicCheck: anEntity
	^ (super basicCheck: anEntity) and: [(anEntity isKindOf: Class) and: [ self class classActivated] ]
