enumerating
check: anEntity forCritiquesDo: aCriticBlock

	(self basicCheck: anEntity)
		ifTrue: [ (self findTestsForClass: anEntity) isEmpty
				ifTrue: [ aCriticBlock value: (SmTClassNeedTestsCritique for: anEntity by: self) ]
				ifFalse: [ aCriticBlock value: (SmTClassRelativeTestsCritique for: anEntity by: self tests: self tests) ] ]