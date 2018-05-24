accessing
extractPackagesFrom: aCollectionOfCompiledMethod
	packages := self extractPackagesWithoutExtensionFrom: aCollectionOfCompiledMethod.
	packages addAll: (aCollectionOfCompiledMethod select: #isExtension thenCollect: [ :aCompiledMethod |  (aCompiledMethod package extendedClasses collect: [ :aClass | aClass package name ] ) asSet] ) flattened
