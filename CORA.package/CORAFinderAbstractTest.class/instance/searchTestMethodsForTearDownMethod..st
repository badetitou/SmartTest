helpers
searchTestMethodsForTearDownMethod: aSelector
	| aCompiledTest |
	
	aCompiledTest := self class lookupSelector: aSelector.
	^ self strategy testsForATearDownMethod: aCompiledTest.