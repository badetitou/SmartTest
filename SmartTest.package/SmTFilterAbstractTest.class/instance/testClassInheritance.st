tests
testClassInheritance
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound testMethodSubClass1 testMethodSubClass2 |
	testsFound := self searchTestMethodsForAClass: (('SmT','P1InheritanceTest') asClass).
	testMethodSubClass1 := RGMethodDefinition className: ('SmTP1','InheritanceSubClass1Test') selector:('testMethod1','Inheritance') isMetaSide:	false.
	testMethodSubClass2 := RGMethodDefinition className: ('SmTP1','InheritanceSubClass2Test') selector:('testMethod1','Inheritance') isMetaSide:	false.
	self assert: (testsFound includes: testMethodSubClass1).
	self assert: (testsFound includes: testMethodSubClass2).