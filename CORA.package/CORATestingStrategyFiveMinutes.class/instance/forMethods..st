instance creation
forMethods: aCompiledMethod
	| tests semaphore |
	semaphore := Semaphore new.
	CORATestingStrategy
		addABlockClosureThatSearchForACompiledMethod: [tests := self getMethodsFor: aCompiledMethod.
			CORACollector addTestMethods: tests.
			semaphore signal] newProcess.
	semaphore wait.
	^ self getTestMethodFromCompiledTestMethod: tests