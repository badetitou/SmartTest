tests
testTearDownMethodForStandardMethodFindsNoTests
	<CORATestBlacklisted>

	self assert: (self searchTestMethodsForTearDownMethod: #method1) isEmpty.