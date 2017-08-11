tests
testTestSelfSelected
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: self dependentTestMethod selector.
	
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: self dependentTestMethod methodReference )