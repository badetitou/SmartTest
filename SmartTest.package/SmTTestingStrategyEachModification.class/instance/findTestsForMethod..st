instance creation
findTestsForMethod: aCompiledMethod
	| tests |
	tests := self getMethodsFor: aCompiledMethod.
	(self getElementFromBag: aCompiledMethod)
		ifNotNil: [ self runner runCases: tests ].
	^ tests