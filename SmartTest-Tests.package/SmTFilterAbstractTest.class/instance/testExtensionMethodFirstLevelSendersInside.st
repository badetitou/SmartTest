test - extension method
testExtensionMethodFirstLevelSendersInside
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP2Test') asClass >> ('extensionMethod1FirstLevelSenders','Inside') asSymbol).
	self assert: (testsFound includes: ((('SmT','ClassTestP1') asClass >> ('testExtensionMethod1FirstLevelSenders','Inside') asSymbol) asRingDefinition)).
	