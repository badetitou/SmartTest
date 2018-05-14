tests
testStandardMethodSecondLevelSendersInsidePackageWithTestOutside
	<CORATestBlacklisted>
	"MyMethod1 is called by MyMethod2, which itself is called by testMyMethod2, a test not owned by the same package as myMethod1, thus testMyMethod2 should not be found. 
	We go out of the package once so it's normal hat the test is not found."
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersInsidePackageWithTestOutside') asSymbol).
	self assert: (testsFound isEmpty ).
	self deny: (testsFound includes: testMethod2SecondLevelSendersInsidePackageWithTestOutside ).
	
	
	