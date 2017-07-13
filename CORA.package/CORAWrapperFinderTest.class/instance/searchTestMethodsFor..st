helpers
searchTestMethodsFor: aSelector
	| aCompiledTest |
	
	aCompiledTest := self class lookupSelector: aSelector.
	^ CORAFinderStrategyWrappers new methodsFor: aCompiledTest.