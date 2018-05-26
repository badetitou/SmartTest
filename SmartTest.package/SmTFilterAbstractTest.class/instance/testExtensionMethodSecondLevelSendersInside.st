tests
testExtensionMethodSecondLevelSendersInside
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP1') asClass >> ('extensionMethod1','SecondLevelSenders') asSymbol).
	
	self deny: (testsFound includes: ((('SmT','ClassTestP3') asClass >> ('testExtensionMethod2','SecondLevelSenders') asSymbol) asRingDefinition )).
	