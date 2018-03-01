tests
testSetupMethodFindsTests
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self testsForASetUpMethod: SmTClassTest >> #setUp.
	self assert: (testsFound) isNotEmpty.
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod1 isMetaSide: false )).
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod2 isMetaSide: false )).
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod3 isMetaSide: false )).
	self assert: (testsFound includes: (RGMethodDefinition className: 'SmTClassTest'  selector: #testMethod4 isMetaSide: false )).