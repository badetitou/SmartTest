tests
testSetupMethodWithNonSetupFindsNoTests
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self testsForASetUpMethod: SmTClassTest >> #testMethod1.

	self assert: testsFound isEmpty.