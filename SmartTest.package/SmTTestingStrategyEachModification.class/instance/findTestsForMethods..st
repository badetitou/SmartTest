instance creation
findTestsForMethods: aCompiledMethod
	| tests semaphore |
	semaphore := Semaphore new.
	SmTTestingStrategy
		addABlockClosureThatSearchForACompiledMethod:  [ tests := self getMethodsFor: aCompiledMethod.
			(SmTOnModificationStrategy get: aCompiledMethod)
				ifNotNil: [ SmTRunnerSettings runner runCases: tests ].
			semaphore signal ] .
	semaphore wait.
	^ tests