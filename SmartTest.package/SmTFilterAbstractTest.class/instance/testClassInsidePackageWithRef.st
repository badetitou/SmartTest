tests
testClassInsidePackageWithRef
"In this test, we want to assert that if the class is used in a method, we find the tests related to this method."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassModificationOnClass','InsidePackageWithRef') asClass.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: ((('RefToSmTClassModificationOnClass','InsidePackageWithRef') asClass  >> ('testRefToSmTClassModificationOnClassInsidePackageWithRef') asSymbol) asRingDefinition )).