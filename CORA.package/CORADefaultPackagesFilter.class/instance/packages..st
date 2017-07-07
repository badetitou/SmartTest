accessing
packages: aCollectionOfCompiledMethod
	packages := aCollectionOfCompiledMethod collect: [:aCompiledMethod | self parseCompiledMethodPackageBaseName: aCompiledMethod ]