enumerating
check: anEntity forCritiquesDo: aCriticBlock
	(self basicCheck: anEntity)
		ifTrue: [ (self findTestsForMethod: anEntity) isEmpty
				ifTrue: [ aCriticBlock value: (SmTMethodNeedTestsCritique for: anEntity by: self) ]
				ifFalse: [ aCriticBlock
						value: (SmTMethodRelativeTestsCritique for: anEntity by: self tests: self tests) ] ]