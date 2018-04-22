instance creation
doFindTestsForMethod: aCompiledMethod
	| tests |
	tests := self getMethodsFor: aCompiledMethod.
	self runner runCases: tests.
	^ tests