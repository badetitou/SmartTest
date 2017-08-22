jenkins
collectClassToTestForPackagesNamed: aCollectionOfPackagesNamed
	^ aCollectionOfPackagesNamed flatCollect: [ :aPackageName | self collectClassToTestForPackage: (self getPackageFromName: aPackageName) ]