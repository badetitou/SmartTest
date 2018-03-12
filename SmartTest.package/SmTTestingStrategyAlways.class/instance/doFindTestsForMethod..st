instance creation
doFindTestsForMethod: aCompiledMethod

	| tests |
	tests := self getMethodsFor: aCompiledMethod.
	self runner runCases: tests.
	^ self getTestMethodFromCompiledTestMethod: tests