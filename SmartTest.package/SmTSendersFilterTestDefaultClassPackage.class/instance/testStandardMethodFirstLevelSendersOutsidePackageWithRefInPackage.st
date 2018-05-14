tests
testStandardMethodFirstLevelSendersOutsidePackageWithRefInPackage
	<CORATestBlacklisted>
	"p1_MyMethod1 is called by p1_MyMethod2, which itself is called by p1_testMyMethod2, a tests owned by the same package as myMethod1, thus p1_testMyMethod2 should be found.
	We never go out of the package so it's normal."
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1FirstLevelSendersOutsideWithRefIn','Package') asClass >> ('method1FirstLevelSendersWithRefIn','Package') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (SmTClassTestP2FirstLevelSendersOutsideWithRefInPackage >> #testMethod1FirstLevelSendersOutsideWithRefInPackage) asRingDefinition ).
	