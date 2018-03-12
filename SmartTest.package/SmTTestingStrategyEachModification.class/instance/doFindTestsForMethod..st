instance creation
doFindTestsForMethod: aCompiledMethod
	| tests |
	tests := self getMethodsFor: aCompiledMethod.
	(SmTOnModificationStrategy get: aCompiledMethod) ifNotNil: [ self runner runCases: tests ].
	^ tests