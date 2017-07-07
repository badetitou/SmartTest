instance creation
forMethods: aCompiledMethod
	| tests semaphore |
	semaphore := Semaphore new.
	[ tests := self getMethodsFor: aCompiledMethod.
	CORACollector addTestMethods: tests.
	semaphore signal ] fork.
	semaphore wait.
	^ self getTestMethodFromCompiledTestMethod: tests