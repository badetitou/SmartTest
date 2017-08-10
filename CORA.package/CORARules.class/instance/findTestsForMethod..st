initialize-release
findTestsForMethod: aCompiledMethod
	^ tests := CORATestingStrategySettings strategy new findTestsForMethods: aCompiledMethod