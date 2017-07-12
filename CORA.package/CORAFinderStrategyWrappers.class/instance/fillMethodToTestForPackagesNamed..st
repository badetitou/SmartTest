accessing
fillMethodToTestForPackagesNamed: aCollectionOfPackagesName
	aCollectionOfPackagesName do: [ :aPackageName | self fillMethodToTestForPackages: (self getPackageFromName: aPackageName ) ]	