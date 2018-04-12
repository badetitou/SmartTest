tests
testResarchTestsForStandardMethodWhileEmptyCache
	<CORATestBlacklisted>
	| testsFound |
	self assert: smartFinder currentCache isEmpty.
	testsFound := self searchTestMethodsFor: SmTClass >> #method2.
	self assert: smartFinder currentCache isEmpty.
	self assert: testsFound isEmpty.
	
