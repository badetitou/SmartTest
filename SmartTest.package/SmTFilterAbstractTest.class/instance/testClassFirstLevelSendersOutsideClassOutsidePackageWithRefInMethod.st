tests
testClassFirstLevelSendersOutsideClassOutsidePackageWithRefInMethod
"In this test, we want to assert that if the class is used in a method, we find the tests related to this method."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassP1FirstLevelSendersOutsideWithRefIn','Method') asClass.
	self assert: (testsFound includes: ((('SmTClassTest','P2') asClass  >> ('testMethod1FirstLevelSendersOutsideWithRef','InMethod') asSymbol) asRingDefinition )).