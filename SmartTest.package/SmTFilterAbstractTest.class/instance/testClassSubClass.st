tests
testClassSubClass
	<CORATestBlacklisted>
	| testsFound testMethodSubClass2 |
	testsFound := self searchTestMethodsForAClass: (('SmT','P1InheritanceSubClass2Test') asClass).
	testMethodSubClass2 := RGMethodDefinition className: ('SmTP1','InheritanceSubClass2Test') selector:('testMethod1','Inheritance') isMetaSide:	false.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: testMethodSubClass2).