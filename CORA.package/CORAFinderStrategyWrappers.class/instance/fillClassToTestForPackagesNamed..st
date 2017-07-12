accessing
fillClassToTestForPackagesNamed: aCollectionOfPackagesNamed
	aCollectionOfPackagesNamed do: [ :aPackageName | self fillClassToTestForPackage: (self getPackageFromName: aPackageName) ]