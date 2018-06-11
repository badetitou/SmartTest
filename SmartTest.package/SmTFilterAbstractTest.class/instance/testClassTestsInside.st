test -modification on class
testClassTestsInside
"In this test we want to assert that SmartTest finds the test owned directly by a class."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassTest','P2Test') asClass.
	self assert: (testsFound includes: ((('SmTClassTest','P2Test') asClass  >> ('testMethod1FirstLevelSendersOutsideWithRefIn','Class') asSymbol) asRingDefinition )).