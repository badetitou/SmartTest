test -modification on class
testClassInheritanceSubClass1
	<CORATestBlacklisted>
	| testsFound testMethodSubClass2 |
	testsFound := self searchTestMethodsForAClass: (('SmTP1ClassTestSubClass','DoesntRedefineMethod') asClass).
	testMethodSubClass2 := RGMethodDefinition className: ('SmTP1ClassTestSubClass','DoesntRedefineMethod') selector:('testModificationOnClass','AbstractTestCase') isMetaSide:	false.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: testMethodSubClass2).