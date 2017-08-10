instance creation
findTestsForMethods: aCollectionOfCompiledMethod
	^tests := aCollectionOfCompiledMethod flatCollect: [ :aCompiledMethod | self findTestsForMethod: aCompiledMethod]