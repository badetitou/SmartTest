instance creation
doFindTestsForMethod: aCompiledMethod
	| tests |
	1halt.
	tests := self getMethodsFor: aCompiledMethod.
	(SmTOnModificationStrategy get: aCompiledMethod) ifNotNil: [ self runner runCases: tests ].
	^ tests