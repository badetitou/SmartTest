tests
testStandardMethodWithSomeOutsidePackage
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass >> #method1.
	
	self assert: (testsFound includes: testMethod1).
	self deny: (testsFound includes: testMethod1OutsidePackage ).