instance creation
doFindTestsForMethod: aCompiledMethod
	| tests|
	tests := self getMethodsFor: aCompiledMethod.
	SmTFivesMinutesCollector addTestMethods: tests.
	^ tests