tests
testResarchTestsForStandardMethodWhileEmptyCache
	<CORATestBlacklisted>
	| testsFound |
	self assert: smartFinder cacheValues isEmpty.
	testsFound := self searchTestMethodsFor: SmTClass >> #method2.
	self assert: smartFinder cacheValues isEmpty.
	self assert: testsFound isNil.
	
