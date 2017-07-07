instance creation
forMethods: aCompiledMethod
	| tests semaphore |
	semaphore := Semaphore new.
	[tests := self getMethodsFor:  aCompiledMethod.
	CORARunnerStrategy runner runCases: tests. 
	semaphore signal.] fork.
	semaphore wait.
	^ self getTestMethodFromCompiledTestMethod: tests