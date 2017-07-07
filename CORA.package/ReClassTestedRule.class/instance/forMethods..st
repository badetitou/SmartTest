instance creation
forMethods: aCollectionOfCompiledMethod
	^tests := aCollectionOfCompiledMethod flatCollect: [ :aCompiledMethod | self forMethod: aCompiledMethod]