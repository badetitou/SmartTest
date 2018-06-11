test -modification on class
testClassOutsidePackageWithRef
"In this test, we want to assert that if the class is used in a method, we find the tests related to this method."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassModificationOnClass','OutsidePackageWithRef') asClass.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: ((('RefToSmTClassModificationOnClassOutsidePackageWithRef') asClass  >> ('testRefToSmTClassModificationOnClass','OutsidePackageWithRef') asSymbol) asRingDefinition )).