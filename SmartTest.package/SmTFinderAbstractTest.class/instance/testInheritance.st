tests
testInheritance
	<CORATestBlacklisted>
	| testsFound testMethod |
	testsFound := self searchTestMethodsFor: ('SmTP1' , 'Inheritance') asClass >> ('method1','Inheritance') asSymbol .
testMethod := RGMethodDefinition className: ('SmTP1InheritanceSubClass2','Test') selector:('testMethod1','Inheritance') asSymbol isMetaSide:	false.
	self assert: testsFound size equals: 2.
	self assert: (testsFound includes: ((('SmTP1InheritanceSubClass1Test') asClass >> ('testMethod1Inheritance') asSymbol) asRingDefinition  )).
	self assert: (testsFound includes: (testMethod) ).