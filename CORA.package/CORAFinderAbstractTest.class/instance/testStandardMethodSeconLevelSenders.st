tests
testStandardMethodSeconLevelSenders
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: #method2.
	testsFound := testsFound collect: #methodReference.
	self assert: (testsFound includes: self dependentTestMethod methodReference )