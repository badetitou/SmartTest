as yet unclassified
testStandardMethodSecondLevelSendersOutsideTestOutsideWithRefInMethod
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : Class1 >> method1 
	 P2 : Class2 >> method2, the reference to Class1 is made in method2
	 P3 : Class3 >> testMethod2, the reference to Class1 is made in testMethod2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersOutsideTestOutsideWithRefIn','Method') asClass >> ('method1SecondLevelSendersOutsideTestOutsideWithRefIn','Method') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTestP3SecondLevelSenderOutsideTestOutsideWithRefIn','Method') asClass >> ('testMethod2SecondLevelSenderOutsideTestOutsideWithRefIn','Method') asSymbol) asRingDefinition ).
	