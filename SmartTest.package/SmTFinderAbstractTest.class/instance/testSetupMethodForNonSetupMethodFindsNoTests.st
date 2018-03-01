tests
testSetupMethodForNonSetupMethodFindsNoTests
	<CORATestBlacklisted>
	self assert: (self testsForASetUpMethod: SmTClassTest >> #testMethod1) isEmpty.