tests
testStandardMethodThirdLevelSenders
	<CORATestBlacklisted>
	| testsFound | 
	self skip.
	testsFound := self searchTestMethodsFor: #method3.
	testsFound := testsFound.
	self assert: (testsFound includes: self dependentTestMethod methodReference )