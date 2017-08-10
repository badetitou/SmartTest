enumerating
check: anEntity forCritiquesDo: aCriticBlock

	(self basicCheck: anEntity)
		ifTrue: [ (self findTestsForClass: anEntity) isEmpty
				ifTrue: [ aCriticBlock value: (CORAClassNeedTestsCritique for: anEntity by: self) ]
				ifFalse: [ aCriticBlock value: (CORAClassRelativeTestsCritique for: anEntity by: self tests: self tests) ] ]