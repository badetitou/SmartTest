tests
testTearDownMethodForStandardMethodFindsNoTests
	<CORATestBlacklisted>

	self assert: (self strategy testsForATearDownMethod: SmTClassTest >> #testMethod1) isEmpty.