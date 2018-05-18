tests
testStandardMethodSecondLevelSendersInsideTestOutsideWithRefInPackage
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and method2
	 P2 : testMethod2, the reference is made in the package of testMethod2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersInsideTestOutsideWithRefIn','Package') asClass >> ('method1SecondLevelSendersInsideTestOutsideWithRefIn','Package') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTest','P2') asClass >> ('testMethod2SecondLevelSenderInsideTestOutsideWithRefIn','Package') asSymbol) asRingDefinition ).
	