tests
testStandardMethodThirdLevelSenders
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: #method3.
	testsFound := testsFound.
	self assert: (testsFound includes: self dependentTestMethod methodReference )