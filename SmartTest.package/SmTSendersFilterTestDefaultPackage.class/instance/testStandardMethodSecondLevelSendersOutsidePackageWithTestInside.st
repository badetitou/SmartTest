tests
testStandardMethodSecondLevelSendersOutsidePackageWithTestInside
	<CORATestBlacklisted>
	"p1_MyMethod1 is called by p2_MyMethod2, which itself is called by p1_testMyMethod2, thus p1_testMyMethod2 should not be found.
	We go out of the package once so it's normal hat the test is not found."
	
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmTClassDefaultPackage','P1') asClass >> ('p1_','myMethod1_SecondLevelSendersOutsidePackageWithTestInside') asSymbol).
	self deny: (testsFound includes: test_p1_MyMethod2_SecondLevelSendersOutsidePackageWithTestInside ).
	
	
	