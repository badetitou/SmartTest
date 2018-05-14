tests
testStandardMethodSecondLevelSendersOutsidePackageWithTestInside
	<CORATestBlacklisted>
	"MyMethod1 is called by MyMethod2, which itself is called by testMyMethod2, thus testMyMethod2 should not be found.
	We go out of the package once so it's normal hat the test is not found."
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersOutsidePackageWithTestInside') asSymbol).
	self assert: (testsFound isEmpty ).	
	self deny: (testsFound includes: testMethod2SecondLevelSendersOutsidePackageWithTestInside ).
	
	
	