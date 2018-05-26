tests
testInheritedMethod
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self
		searchTestMethodsFor: ('SmT' , 'P1Inheritance') asClass >> ('method1' , 'Inheritance') asSymbol.
	self
		assert: testsFound
		equalsToMethods:
			#('SmTP1InheritanceSubClass1Test>>#testMethod1Inheritance' 'SmTP1InheritanceSubClass2Test>>#testMethod1Inheritance')