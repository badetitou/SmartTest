test -modification on class
testClassTestsInside
"In this test we want to assert that SmartTest finds the test owned directly by a class."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassTest','P2') asClass.
	self assert: (testsFound includes: ((('SmTClassTest','P2') asClass  >> ('testMethod1FirstLevelSendersOutsideWithRefIn','Class') asSymbol) asRingDefinition )).