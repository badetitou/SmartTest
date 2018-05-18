tests
testStandardMethodInheritance
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmT','P1Inheritance') asClass >> ('method1','Inheritance') asSymbol).
	self assert: testsFound size equals: 1.
	self deny: (testsFound includes:  ('SmT','P1Inheritance') asClass >> ('testMethod1','Inheritance') asSymbol).
	
	
	