accessing
fillMethodToTestFrom: aCollectionOfTests
	aCollectionOfTests do: [ :aMethod | self searchRelativeTestForMethod: aMethod ]