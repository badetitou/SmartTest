tests
testStandardMethodSeconLevelSenders
	| testsFound | 
	testsFound := self searchTestMethodsFor: #method2.
	
	self assert: (testsFound includes: self dependentTestMethod)