instance creation
findTestsForMethod: aCompiledMethod
	| tests ended |
	ended := false.
	SmTTestingStrategy
		addABlockClosureThatSearchForACompiledMethod: [ :skip | 
			skip
				ifFalse: [ tests := self getMethodsFor: aCompiledMethod.
					SmTFivesMinutesCollector addTestMethods: tests ].
			ended := true ].
	[ ended ] whileFalse.
	^ self getTestMethodFromCompiledTestMethod: tests