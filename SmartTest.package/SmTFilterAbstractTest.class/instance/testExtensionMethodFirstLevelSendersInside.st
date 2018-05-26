tests
testExtensionMethodFirstLevelSendersInside
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP2') asClass >> ('extensionMethod1FirstLevelSenders','Inside') asSymbol).
	self assert: (testsFound includes: ((('SmT','ClassTestP1') asClass >> ('testExtensionMethod1FirstLevelSenders','Inside') asSymbol) asRingDefinition)).
	