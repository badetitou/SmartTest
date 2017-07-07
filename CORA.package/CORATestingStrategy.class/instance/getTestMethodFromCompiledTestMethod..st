instance creation
getTestMethodFromCompiledTestMethod: aCollectionOfCompiledMethod
	^ aCollectionOfCompiledMethod collect: [:aCompiledMethod | aCompiledMethod methodClass selector: aCompiledMethod selector ]