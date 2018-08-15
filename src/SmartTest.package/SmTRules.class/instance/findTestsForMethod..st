initialize-release
findTestsForMethod: aCompiledMethod
	^ tests := self class testFinder findTestsForMethod: aCompiledMethod