instance creation
forMethods: aCompiledMethod
	| tests semaphore |
	semaphore := Semaphore new.
	CORATestingStrategy
		addABlockClosureThatSearchForACompiledMethod: [ tests := self getMethodsFor: aCompiledMethod.
			CORARunnerStrategy runner runCases: tests.
			semaphore signal ].
	semaphore wait.
	^ self getTestMethodFromCompiledTestMethod: tests