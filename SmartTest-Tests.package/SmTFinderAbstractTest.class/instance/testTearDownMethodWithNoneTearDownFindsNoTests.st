tests
testTearDownMethodWithNoneTearDownFindsNoTests
	<CORATestBlacklisted>

	self assert: (self searchTestsForATearDownMethod: SmTClassTest >> #testMethod1) isEmpty.