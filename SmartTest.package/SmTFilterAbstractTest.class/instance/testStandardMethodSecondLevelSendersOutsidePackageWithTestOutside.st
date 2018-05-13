tests
testStandardMethodSecondLevelSendersOutsidePackageWithTestOutside
	<CORATestBlacklisted>
	"p1_MyMethod1 is called by p2_MyMethod2, which itself is called by p2_testMyMethod2, thus p2_testMyMethod2 should not be found.
	We go out of the package once so it's normal hat the test is not found."
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1_','SecondLevelSendersOutsidePackageWithTestOutside') asSymbol).
	self assert: (testsFound isEmpty ).
	self deny: (testsFound includes: test_method2_SecondLevelSendersOutsidePackageWithTestOutside ).
	
	
	