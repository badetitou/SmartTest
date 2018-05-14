tests
testStandardMethodFirstLevelSendersOutsidePackage
	<CORATestBlacklisted>
	"MyMethod1 is called by testMyMethod2, a test not owned by the same package as myMethod1 but its package matches the regex so it should be found"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','FirstLevelSendersOutsidePackage') asSymbol).
	self assert: testsFound size equals: 1 .
	self assert:   (testsFound includes: testMethod1FirstLevelSendersOutsidePackage).
	
	
	