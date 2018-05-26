tests
testExtensionTestInside
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP1_2') asClass >> ('method1ExtensionTest','Inside') asSymbol).
	
	self deny: (testsFound includes: ((('SmT','ClassTestP3') asClass >> ('testMethod1ExtensionTest','Inside') asSymbol) asRingDefinition )).
	