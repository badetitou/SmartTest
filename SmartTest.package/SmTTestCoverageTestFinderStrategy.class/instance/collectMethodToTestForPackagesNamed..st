jenkins
collectMethodToTestForPackagesNamed: aCollectionOfPackagesName
	^ aCollectionOfPackagesName flatCollect: [ :aPackageName | self collectMethodToTestForPackage: (self getPackageFromName: aPackageName ) ]	