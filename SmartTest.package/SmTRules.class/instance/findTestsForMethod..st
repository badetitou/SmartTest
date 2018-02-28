initialize-release
findTestsForMethod: aCompiledMethod
	^ tests := self class testFinder findTestsForMethods: aCompiledMethod