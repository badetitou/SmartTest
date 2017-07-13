as yet unclassified
fillMethodToTestForPackagesNamed: aCollectionOfPackagesName
	aCollectionOfPackagesName do: [ :aPackageName | self fillMethodToTestForPackage: (self getPackageFromName: aPackageName ) ]	