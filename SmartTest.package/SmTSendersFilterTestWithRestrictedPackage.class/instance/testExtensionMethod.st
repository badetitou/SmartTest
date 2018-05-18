tests
testExtensionMethod
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','Extension') asClass >> ('my','Extension') asSymbol).
	self assert: (testsFound includes: (('SmT','ClassTestP1') asClass >> ('testMyExtension','InP1') asSymbol) asRingDefinition).
	self deny: (testsFound includes: (('SmT','ClassTestP2') asClass >> ('testMyExtension','InP2') asSymbol) asRingDefinition ).
	