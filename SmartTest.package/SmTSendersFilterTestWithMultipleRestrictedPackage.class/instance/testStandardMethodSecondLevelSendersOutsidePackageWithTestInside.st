running
testStandardMethodSecondLevelSendersOutsidePackageWithTestInside
	<CORATestBlacklisted>
	"p1_MyMethod1 is called by p2_MyMethod2, which itself is called by p1_testMyMethod2, both methods (the test and the method) are not owned by the same package as myMethod1 but their packages matches the regex so it should be found"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersOutsidePackageWithTestInside') asSymbol).
	self assert: testsFound size equals: 1 .
	self assert:    (testsFound includes: testMethod2SecondLevelSendersOutsidePackageWithTestInside ).
	
	
	