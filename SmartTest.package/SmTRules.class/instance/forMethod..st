initialize-release
forMethod: aCompiledMethod
	^ tests := SmTTestingStrategySettings strategy new findTestsForMethods: aCompiledMethod