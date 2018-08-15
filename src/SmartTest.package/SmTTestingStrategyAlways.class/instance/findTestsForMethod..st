instance creation
findTestsForMethod: aCompiledMethod
	| tests |
	tests := self getMethodsFor: aCompiledMethod.
	self runner runCases: tests.
	^ tests