tests
testStandardMethodFirstLevelSenders
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: #method1.
	testsFound := testsFound.
	self assert: (testsFound includes: self dependentTestMethod methodReference)