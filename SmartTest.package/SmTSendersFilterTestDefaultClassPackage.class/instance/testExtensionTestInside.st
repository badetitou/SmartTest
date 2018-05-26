tests
testExtensionTestInside
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP1_2') asClass >> ('method1ExtensionTest','Inside') asSymbol).
	
	self assert: (testsFound includes: ((('SmT','ClassTestP3') asClass >> ('testMethod1ExtensionTest','Inside') asSymbol) asRingDefinition )).
	