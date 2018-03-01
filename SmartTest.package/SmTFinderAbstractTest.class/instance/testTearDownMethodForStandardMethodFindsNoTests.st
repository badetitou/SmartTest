tests
testTearDownMethodForStandardMethodFindsNoTests
	<CORATestBlacklisted>

	self assert: (self testsForATearDownMethod: SmTClassTest >> #testMethod1) isEmpty.