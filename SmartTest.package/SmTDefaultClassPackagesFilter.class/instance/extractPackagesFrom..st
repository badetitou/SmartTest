accessing
extractPackagesFrom: aCollectionOfCompiledMethod
	super extractPackagesFrom: aCollectionOfCompiledMethod.
  packages addAll: (super
		extractPackagesWithoutExtensionFrom:
			((aCollectionOfCompiledMethod collect: #methodClass) flatCollect: [ :aClass | aClass allCallsOn collect: #compiledMethod ])).
	packages addAll: ((aCollectionOfCompiledMethod collect: #methodClass) flatCollect: [ :aClass | aClass extendingPackages collect: [ :aPackage| self extractCompiledMethodPackageBaseName: aPackage  ] ]) asOrderedCollection .