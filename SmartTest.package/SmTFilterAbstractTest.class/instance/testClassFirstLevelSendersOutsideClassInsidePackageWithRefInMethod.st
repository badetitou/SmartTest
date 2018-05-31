tests
testClassFirstLevelSendersOutsideClassInsidePackageWithRefInMethod
"In this test, we want to assert that if the class is used in a method, we find the tests related to this method."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassP1FirstLevelSendersInsideWithRefIn','Method') asClass.
	self assert: (testsFound includes: ((('SmTP1FirstLevelSendersInsideWithRefInMethod','Test') asClass  >> ('testMethod1FirstLevelSendersInsideWithRefIn','Method') asSymbol) asRingDefinition )).