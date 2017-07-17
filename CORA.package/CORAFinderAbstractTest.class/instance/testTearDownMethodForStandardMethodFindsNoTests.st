tests
testTearDownMethodForStandardMethodFindsNoTests

	self assert: (self searchTestMethodsForTearDownMethod: #method1) isEmpty.