tests
testSetupMethodWithNonSetupFindsNoTests
"asserts that if we use the method 'testsForASetupMethod' with a non setup method as a parameter, the method returns nothing"
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self testsForASetUpMethod: SmTClassTest >> #testMethod1.

	self assert: testsFound isEmpty.