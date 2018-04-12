api
nextAction
	| past testSuite |
	testSuite := self createTestSuiteFrom: selectedModel listItems.
	past := smartFinder smtFinder.
	smartFinder smtFinder: SmTReflectivityTestFinderStrategy new.
	smartFinder buildCacheFromTestSuite: testSuite.
	smartFinder smtFinder: past.
	self delete