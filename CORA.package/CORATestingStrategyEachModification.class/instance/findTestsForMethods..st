instance creation
findTestsForMethods: aCompiledMethod
	| tests semaphore |
	semaphore := Semaphore new.
	CORATestingStrategy
		addABlockClosureThatSearchForACompiledMethod:  [ tests := self getMethodsFor: aCompiledMethod.
			(CORAOnModificationStrategy get: aCompiledMethod)
				ifNotNil: [ CORARunnerSettings runner runCases: tests ].
			semaphore signal ] .
	semaphore wait.
	^ tests