as yet unclassified
fillMethodToTestForPackages: aCollectionOfPackage
	aCollectionOfPackage do: [ :aPackage | self fillMethodToTestForPackage: aPackage ]