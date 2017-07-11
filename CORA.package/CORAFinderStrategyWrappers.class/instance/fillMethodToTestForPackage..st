accessing
fillMethodToTestForPackage: aCollectionOfPackage
	aCollectionOfPackage do: [ :aPackage | aPackage methods do: [ :aMethod | self searchRelativeTestForMethod: aMethod ]]