accessing
extractPackagesWithoutExtensionFrom: aCollectionOfCompiledMethod
	^(aCollectionOfCompiledMethod collect: [:aCompiledMethod | self extractCompiledMethodPackageBaseName: aCompiledMethod ]) asOrderedCollection.
	