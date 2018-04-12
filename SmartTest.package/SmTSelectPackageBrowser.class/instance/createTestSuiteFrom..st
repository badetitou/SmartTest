api
createTestSuiteFrom: listItem
	| testSuite |
	testSuite := TestSuite new.
	testSuite addTests: ((listItem flatCollect: #methods) select: #isTestMethod thenCollect: #asTestCase).
	^ testSuite