jenkins
collectMethodToTestForPackages: aCollectionOfPackage
	^ aCollectionOfPackage flatCollect: [ :aPackage | self collectMethodToTestForPackage: aPackage ]