accessing
fillMethodToTestForPackages: aCollectionOfPackage
	aCollectionOfPackage do: [ :aPackage | self fillMethodToTestForPackage: aPackage ]