tests
testStandardMethodFirstLevelSenders
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: SmTClass >> #method2.
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod2 isMetaSide: false )).
	self deny: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod1 isMetaSide: false )).
	self deny: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod3 isMetaSide: false )).
	self deny: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod4 isMetaSide: false )).