tests
testTearDownMethodWithNoneTearDownFindsNoTests
	<CORATestBlacklisted>

	self assert: (self testsForATearDownMethod: SmTClassTest >> #testMethod1) isEmpty.