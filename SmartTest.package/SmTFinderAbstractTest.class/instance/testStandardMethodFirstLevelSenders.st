tests
testStandardMethodFirstLevelSenders
	<CORATestBlacklisted>
	| testsFound |
	self skip.
	testsFound := self searchTestMethodsFor: #method1.
	testsFound := testsFound.
	self assert: (testsFound includes: self dependentTestMethod methodReference)