tests
testStandardMethodFirstLevelSendersOutsidePackageWithRefInMethod
	<CORATestBlacklisted>
	"method1 is called by testMethod1"
	"P1 : method1
	 P2 : testMethod1, the reference is made in testMethod1"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1FirstLevelSendersOutsideWithRefIn','Method') asClass >> ('method1','FirstLevelSendersWithRefInMethod') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTest','P2') asClass >> ('testMethod1FirstLevelSendersOutsideWithRefIn','Method') asSymbol) asRingDefinition ).