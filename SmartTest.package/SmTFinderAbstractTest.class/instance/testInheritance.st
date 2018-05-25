tests
testInheritance
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: ('SmTP1' , 'Inheritance') asClass >> ('method1','Inheritance') asSymbol .

	self assert: testsFound size equals: 2.
	self assert: (testsFound includes: ((SmTP1InheritanceSubClass1Test >> #testMethod1Inheritance) asRingDefinition  )).
	self assert: (testsFound includes: ( (SmTP1InheritanceSubClass2Test >> #testMethod1Inheritance) asRingDefinition  )).