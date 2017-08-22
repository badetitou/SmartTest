instance creation
findTestsForMethods: aCompiledMethod
	| tests semaphore |
	semaphore := Semaphore new.
	SmTTestingStrategy
		addABlockClosureThatSearchForACompiledMethod: [tests := self getMethodsFor: aCompiledMethod.
			SmTFivesMinutesCollector addTestMethods: tests.
			semaphore signal].
	semaphore wait.
	^ self getTestMethodFromCompiledTestMethod: tests