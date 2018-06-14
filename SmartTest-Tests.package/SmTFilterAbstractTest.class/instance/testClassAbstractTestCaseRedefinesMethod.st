test -modification on class
testClassAbstractTestCaseRedefinesMethod
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound testMethodSubClass1 testMethodSubClass2 |
	testsFound := self searchTestMethodsForAClass: (('SmTP1ClassTestAbstractTestCase') asClass).
	testMethodSubClass2 := RGMethodDefinition className: ('SmTP1ClassTestSubclassRedefines','Method') selector:('testModificationOnClassAbstract','TestCase') isMetaSide:	false.
	self assert: (testsFound includes: testMethodSubClass2).