tests
testStandardMethodThirdLevelSenders
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: #method3.
	testsFound := testsFound collect: #methodReference.
	self assert: (testsFound includes: self dependentTestMethod methodReference )