initialize-release
forMethod: aCompiledMethod
	^ tests := CORATestingStrategySettings strategy new findTestsForMethods: aCompiledMethod