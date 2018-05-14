tests
testStandardMethodFirstLevelSendersOutsidePackage2
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: (SmTClassOutside >> #method2).
	self assert: testsFound isEmpty.