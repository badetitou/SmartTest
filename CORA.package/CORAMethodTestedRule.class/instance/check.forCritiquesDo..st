enumerating
check: anEntity forCritiquesDo: aCriticBlock
	(self basicCheck: anEntity)
		ifTrue: [ (self findTestsForMethod: anEntity) isEmpty
				ifTrue: [ aCriticBlock value: (CORAMethodNeedTestsCritique for: anEntity by: self) ]
				ifFalse: [ aCriticBlock value: (CORAMethodRelativeTestsCritique for: anEntity by: self tests: self tests) ] ]