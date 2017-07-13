helpers
searchTestMethodsFor: aSelector
	| aCompiledTest |
	
	aCompiledTest := self class lookupSelector: aSelector.
	^ CORAFinderStrategyChangeImpact new methodsFor: aCompiledTest.