tests
testTearDownMethodFindsTests
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestsForATearDownMethod: SmTClassTest >> #tearDown.

	self assert: testsFound isNotEmpty.
	self assert: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self assert: (testsFound includes: testMethod3).
	self assert: (testsFound includes: testMethod4).