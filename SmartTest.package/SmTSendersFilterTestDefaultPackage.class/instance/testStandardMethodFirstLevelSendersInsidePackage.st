tests
testStandardMethodFirstLevelSendersInsidePackage
	<CORATestBlacklisted>
	"MyMethod1 is called by testMyMethod1, a tests owned by the same package as myMethod1, the only test found should be testMyMethod1"
	
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmTClassDefaultPackage','P1') asClass >> ('p1_','myMethod1_FirstLevelSendersInsidePackage') asSymbol).
	self assert: (testsFound includes: test_p1_myMethod1_FirstLevelSendersInsidePackage).
	
	
	