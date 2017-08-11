instance creation
findTestsForMethods: aCompiledMethod
	| tests semaphore |
	semaphore := Semaphore new.
	CORATestingStrategy
		addABlockClosureThatSearchForACompiledMethod: [tests := self getMethodsFor: aCompiledMethod.
			CORAFivesMinutesCollector addTestMethods: tests.
			semaphore signal].
	semaphore wait.
	^ self getTestMethodFromCompiledTestMethod: tests