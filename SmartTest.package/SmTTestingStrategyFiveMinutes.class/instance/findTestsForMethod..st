instance creation
findTestsForMethod: aCompiledMethod
	| tests |
	tests := self getMethodsFor: aCompiledMethod.
	SmTFivesMinutesCollector addTestMethods: tests.
	^ tests