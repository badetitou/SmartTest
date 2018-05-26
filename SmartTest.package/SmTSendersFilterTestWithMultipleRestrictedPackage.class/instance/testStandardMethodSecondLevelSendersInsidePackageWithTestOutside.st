running
testStandardMethodSecondLevelSendersInsidePackageWithTestOutside
	<CORATestBlacklisted>
	"method1 is called by method2, which itself is called by testMethod2, both methods (the test and the method) are not owned by the same package as myMethod1 but their packages matches the regex so it should be found"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"

	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersInsidePackageWithTestOutside') asSymbol).
	self assert: testsFound size equals: 1 .
	self assert:    (testsFound includes: testMethod2SecondLevelSendersInsidePackageWithTestOutside ).
	
	
	