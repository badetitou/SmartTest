tests
testStandardMethodFirstLevelSendersOutsidePackage
	<CORATestBlacklisted>
	"method1 is called by testMethod2, a test not owned by the same package as method1, thus it should not be found"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','FirstLevelSendersOutsidePackage') asSymbol).
	self assert: (testsFound isEmpty ).
	self deny:   (testsFound includes: testMethod1FirstLevelSendersOutsidePackage).
	
	
	