tests
testSetupMethodForNonSetupMethodFindsNoTests

	self assert: (self searchTestMethodsForSetupMethod: #method1) isEmpty.