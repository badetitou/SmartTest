initialization
testModificationOnInitialize
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass2 >> #initialize.

	self deny: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4).
	self assert: (testsFound includes: testMethod5).