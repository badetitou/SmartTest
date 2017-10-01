instance creation
findTestsForMethods: aCompiledMethod
	| tests ended |
	ended := false.
	SmTTestingStrategy
		addABlockClosureThatSearchForACompiledMethod: [ :skip | 
			skip
				ifFalse: [ tests := self getMethodsFor: aCompiledMethod.
					(SmTOnModificationStrategy get: aCompiledMethod)
						ifNotNil: [ SmTRunnerSettings runner runCases: tests ] ].
			ended := true ].
	[ ended ] whileFalse.
	^ tests