tests
testStandardMethodSeconLevelSenders
	<CORATestBlacklisted>
	| testsFound |
	self skip.
	testsFound := self searchTestMethodsFor: #method2.
	testsFound := testsFound.
	self assert: (testsFound includes: self dependentTestMethod methodReference )