test - extension method
testExtensionMethodFirstLevelSendersOutside
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP2') asClass >> ('extensionMethod1FirstLevelSenders','Outside') asSymbol).
	self assert: (testsFound includes: ((('SmT','ClassTestP2') asClass >> ('testExtensionMethod1FirstLevelSenders','Outside') asSymbol) asRingDefinition )).
	