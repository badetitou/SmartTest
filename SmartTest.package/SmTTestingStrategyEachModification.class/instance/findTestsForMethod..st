instance creation
findTestsForMethod: aCompiledMethod
	| tests ended |
	ended := false.
	SmTTestingStrategy
		addABlockClosureThatSearchForACompiledMethod: [ :skip | 
			1halt.
			skip
				ifFalse: [ tests := self getMethodsFor: aCompiledMethod.
					(SmTOnModificationStrategy get: aCompiledMethod) ifNotNil: [ self runner runCases: tests ] ].
			ended := true ].
	[ ended ] whileFalse.
	^ tests