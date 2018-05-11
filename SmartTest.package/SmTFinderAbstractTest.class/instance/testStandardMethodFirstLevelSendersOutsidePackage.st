test-filter
testStandardMethodFirstLevelSendersOutsidePackage
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass >> #method2.

	self deny: (testsFound includes: testMethod1).
	self assert: (testsFound includes: testMethod2).
	self deny: (testsFound includes: testMethod3).
	self deny: (testsFound includes: testMethod4).
	self deny: (testsFound includes: testMethodOutsidePackage1)