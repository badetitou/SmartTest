tests
testStandardMethodSecondLevelSendersOutsideTestInsideWithRefInMethod
	<CORATestBlacklisted>
	"method1 is called by testMethod1, which is not in the same package but there is reference to method1's class in a method in the same package as testmethod1, thus testMethod1 should be found."
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersOutsideTestInsideWithRefIn','Method') asClass >> ('testMethod2SecondLevelSendersOutsideTestInsideWithRefIn','Method') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassP1SecondLevelSendersOutsideTestInsideWithRefIn','Method') asClass >> #testMethod2SecondLevelSendersOutsideTestInsideWithRefInMethod) asRingDefinition ).
	