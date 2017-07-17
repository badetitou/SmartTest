helpers
searchTestMethodsForSetupMethod: aSelector
	| aCompiledTest |
	
	aCompiledTest := self class lookupSelector: aSelector.
	^ self strategy testsForASetUpMethod: aCompiledTest.