tests
testStandardMethodFirstLevelSendersOutsidePackage
	<CORATestBlacklisted>
	"MyMethod1 is called by testMyMethod2, a test not owned by the same package as myMethod1 but its package matches the regex so it should be found"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','FirstLevelSendersOutsidePackage') asSymbol).
	self assert: testsFound size equals: 1 .
	self assert:   (testsFound includes: testMethod1FirstLevelSendersOutsidePackage).
	
	
	