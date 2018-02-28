accessing
extractPackagesFrom: aCollectionOfCompiledMethod
	packages := aCollectionOfCompiledMethod collect: [:aCompiledMethod | self extractCompiledMethodPackageBaseName: aCompiledMethod ]