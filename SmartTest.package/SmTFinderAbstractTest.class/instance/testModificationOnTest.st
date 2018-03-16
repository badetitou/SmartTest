tests
testModificationOnTest
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClassTest >> #testMethod4.

	self deny: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self assert: (testsFound includes: testMethod4).