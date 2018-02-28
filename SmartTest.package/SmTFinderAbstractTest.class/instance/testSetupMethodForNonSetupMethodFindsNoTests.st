tests
testSetupMethodForNonSetupMethodFindsNoTests
	<CORATestBlacklisted>
	self assert: (self strategy testsForASetUpMethod: SmTClassTest >> #testMethod1) isEmpty.