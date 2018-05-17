tests
testStandardMethodInheritance
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmT','P1InheritanceSubClass1') asClass >> ('method1','Inheritance') asSymbol).
	self assert: testsFound size equals: 1.
	self deny: (testsFound includes:  ('SmT','P1InheritanceSubClass1') asClass >> ('testMethod1','Inheritance') asSymbol).
	
	
	