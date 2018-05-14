tests
testStandardMethodSecondLevelSendersInsidePackageWithTestInside
	<CORATestBlacklisted>
	"p1MyMethod1 is called by p1MyMethod2, which itself is called by p1testMyMethod2, a tests owned by the same package as myMethod1, thus p1testMyMethod2 should be found.
	We never go out of the package so it's normal."
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersInsidePackageWithTestInside') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: testMethod2SecondLevelSendersInsidePackageWithTestInside ).
	
	
	