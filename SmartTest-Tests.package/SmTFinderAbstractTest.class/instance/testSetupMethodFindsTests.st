tests
testSetupMethodFindsTests
"asserts that the method SmTClassTest>>setup is related to the testMethods 1 to 4 and that 'testsForASetupMethod' finds all the good tests related to a setup method."
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestsForASetUpMethod: SmTClassTest >> #setUp.

	self assert: testsFound isNotEmpty.
	self assert: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self assert: (testsFound includes: testMethod3).
	self assert: (testsFound includes: testMethod4).