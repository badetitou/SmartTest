tests
testTestSelfSelected
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: SmTClassTest >> #testMethod1.
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod1 isMetaSide: false ))