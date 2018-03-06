tests
testSetupMethodFindsTests
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self testsForASetUpMethod: SmTClassTest >> #setUp.

	self assert: testsFound isNotEmpty.
	self assert: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self assert: (testsFound includes: testMethod3).
	self assert: (testsFound includes: testMethod4).