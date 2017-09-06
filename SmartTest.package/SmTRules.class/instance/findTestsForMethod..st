initialize-release
findTestsForMethod: aCompiledMethod
	
	^ tests := SmTTestingStrategySettings strategy new findTestsForMethods: aCompiledMethod