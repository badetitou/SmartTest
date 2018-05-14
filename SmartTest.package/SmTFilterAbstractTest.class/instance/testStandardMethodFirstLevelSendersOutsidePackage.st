tests
testStandardMethodFirstLevelSendersOutsidePackage
	<CORATestBlacklisted>
	"MyMethod1 is called by testMyMethod2, a test not owned by the same package as myMethod1, thus it should not be found"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1_','FirstLevelSendersOutsidePackage') asSymbol).
	self assert: (testsFound isEmpty ).
	self deny:   (testsFound includes: test_method1_FirstLevelSendersOutsidePackage).
	
	
	