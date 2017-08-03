tests
testStandardMethodFirstLevelSenders
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: #method1.
	testsFound := testsFound collect: #methodReference.
	self assert: (testsFound includes: self dependentTestMethod methodReference)