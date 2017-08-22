accessing
packages: aCollectionOfCompiledMethod
	packages := aCollectionOfCompiledMethod collect: [:aCompiledMethod | self extractCompiledMethodPackageBaseName: aCompiledMethod ]