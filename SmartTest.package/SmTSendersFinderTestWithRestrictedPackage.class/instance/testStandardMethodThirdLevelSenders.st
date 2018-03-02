initialization
testStandardMethodThirdLevelSenders
	<CORATestBlacklisted>
	| testsFound | 
	testsFound := self searchTestMethodsFor: SmTClass >> #method4.
	self assert: testsFound size equals: 3.
	self deny: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod1 isMetaSide: false )).
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod2 isMetaSide: false )).
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod3 isMetaSide: false )).
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod4 isMetaSide: false )).