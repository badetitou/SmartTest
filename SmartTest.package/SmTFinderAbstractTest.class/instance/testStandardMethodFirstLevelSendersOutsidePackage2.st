tests
testStandardMethodFirstLevelSendersOutsidePackage2
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClassOutSide >> #method2.
	self deny: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4).
	self assert: (testsFound includes: testMethodOutSidePackage1)