tests
testInheritance
	<CORATestBlacklisted>
	| testsFound testMethod |
	testsFound := self searchTestMethodsFor: ('SmTP1' , 'Inheritance') asClass >> ('method1','Inheritance') asSymbol .
testMethod := RGMethodDefinition className: 'SmTP1InheritanceSubClass2Test' selector:	#testMethod1Inheritance isMetaSide:	false.
	self assert: testsFound size equals: 2.
	self assert: (testsFound includes: ((SmTP1InheritanceSubClass1Test >> #testMethod1Inheritance) asRingDefinition  )).
	self assert: (testsFound includes: (testMethod) ).