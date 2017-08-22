helpers
searchTestMethodsFor: aSelector
	| aCompiledTest |
	
	aCompiledTest := self class lookupSelector: aSelector.
	^ self strategy methodsFor: aCompiledTest.