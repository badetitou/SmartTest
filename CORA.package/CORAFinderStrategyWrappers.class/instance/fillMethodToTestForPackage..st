accessing
fillMethodToTestForPackage: aPackage
	aPackage methods do: [ :aMethod | self searchRelativeTestForMethod: aMethod ]