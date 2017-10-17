tests
testSetupMethodForNonSetupMethodFindsNoTests
	<CORATestBlacklisted>
	self assert: (self searchTestMethodsForSetupMethod: #method1) isEmpty.