instance creation
forMethods: aCompiledMethod
	| tests semaphore |
	semaphore := Semaphore new.
	[ tests := self getMethodsFor:  aCompiledMethod.
	(CORAOnModificationStrategy get: aCompiledMethod)ifNotNil: [ CORARunnerSettings runner runCases: tests ].
	semaphore signal ] fork.
	semaphore wait.
	^ tests