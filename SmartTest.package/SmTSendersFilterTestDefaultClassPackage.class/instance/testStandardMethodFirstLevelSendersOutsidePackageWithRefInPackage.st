tests
testStandardMethodFirstLevelSendersOutsidePackageWithRefInPackage
	<CORATestBlacklisted>
	"method1 is called by method2, which itself is called by testMethod2, a tests owned by the same package as method1, thus testMethod2 should be found.
	We never go out of the package so it's normal."
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1FirstLevelSendersOutsideWithRefIn','Package') asClass >> ('method1FirstLevelSendersWithRefIn','Package') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (SmTClassTestP2FirstLevelSendersOutsideWithRefInPackage >> #testMethod1FirstLevelSendersOutsideWithRefInPackage) asRingDefinition ).
	