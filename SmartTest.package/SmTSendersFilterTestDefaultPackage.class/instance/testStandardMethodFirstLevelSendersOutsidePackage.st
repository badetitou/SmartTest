tests
testStandardMethodFirstLevelSendersOutsidePackage
	<CORATestBlacklisted>
	"MyMethod1 is called by testMyMethod2, a test not owned by the same package as myMethod1, thus it should not be found"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassDefaultPackage','P1') asClass >> ('p1_','myMethod1_FirstLevelSendersInsidePackage') asSymbol).
	self deny:   (testsFound includes: test_p2_myMethod1_FirstLevelSendersOutsidePackage).
	
	
	