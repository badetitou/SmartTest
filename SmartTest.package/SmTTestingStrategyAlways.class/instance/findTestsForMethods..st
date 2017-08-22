instance creation
findTestsForMethods: aCompiledMethod
	| tests semaphore |
	semaphore := Semaphore new.
	SmTTestingStrategy
		addABlockClosureThatSearchForACompiledMethod: [tests := self getMethodsFor: aCompiledMethod.
			SmTRunnerSettings runner runCases: tests.
			semaphore signal] .
	semaphore wait.
	^ self getTestMethodFromCompiledTestMethod: tests