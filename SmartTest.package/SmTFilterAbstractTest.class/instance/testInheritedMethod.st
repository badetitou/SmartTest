tests
testInheritedMethod
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','P1Inheritance') asClass >> ('method1','Inheritance') asSymbol).
	self assert: (testsFound includes: ((('SmT','P1InheritanceSubClass1Test') asClass >> ('testMethod1','Inheritance') asSymbol) asRingDefinition)).
	self assert: (testsFound includes: ((('SmT','P1InheritanceTest') asClass >> ('testMethod1','Inheritance') asSymbol) asRingDefinition)).
	