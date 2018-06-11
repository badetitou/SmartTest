test - standard method - first level sender
testStandardMethodFirstLevelSendersInsidePackage
	<CORATestBlacklisted>
	"method1 is called by testMethod1, a tests owned by the same package as method1, the only test found should be testMethod1"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmTClass','P1') asClass >> ('method1','FirstLevelSendersInsidePackage') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: testMethod1FirstLevelSendersInsidePackage).
	
	
	