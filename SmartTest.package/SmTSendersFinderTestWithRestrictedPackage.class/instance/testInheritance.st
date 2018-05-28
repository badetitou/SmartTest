tests
testInheritance
	<CORATestBlacklisted>
	"The test is outside of the scope of the test"
	| testsFound |
	testsFound := self searchTestMethodsFor: ('SmTP1' , 'Inheritance') asClass >> #method1Inheritance.

	self assert: testsFound isEmpty.
	self deny: (testsFound includes: ((SmTP1InheritanceSubClass1Test >> #testMethod1Inheritance) asRingDefinition  )).
	self deny: (testsFound includes: ( (RGMethodDefinition className: 'SmTP1InheritanceSubClass2Test' selector:	#testMethod1Inheritance isMetaSide:	false) asRingDefinition  )).