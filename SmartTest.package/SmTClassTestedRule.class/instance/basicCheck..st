running
basicCheck: anEntity
	^ (anEntity isKindOf: Class) and:( (super basicCheck: anEntity ) and: (SmTActivatedClassAnalyseSettings activated))