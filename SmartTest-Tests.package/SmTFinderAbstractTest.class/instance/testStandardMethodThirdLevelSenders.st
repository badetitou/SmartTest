tests
testStandardMethodThirdLevelSenders
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: SmTClass >> #method4.

	self deny: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self assert: (testsFound includes: testMethod3).
	self assert: (testsFound includes: testMethod4).