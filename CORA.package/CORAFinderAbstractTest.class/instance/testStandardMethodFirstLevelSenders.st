tests
testStandardMethodFirstLevelSenders
	| testsFound | 
	testsFound := self searchTestMethodsFor: #method1.
	
	self assert: (testsFound includes: self dependentTestMethod)