test - extension method
testExtensionMethodFirstLevelSendersOutside
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP2Test') asClass >> ('extensionMethod1FirstLevelSenders','Outside') asSymbol).
	self assert: (testsFound includes: ((('SmT','ClassTestP2Test') asClass >> ('testExtensionMethod1FirstLevelSenders','Outside') asSymbol) asRingDefinition )).
	