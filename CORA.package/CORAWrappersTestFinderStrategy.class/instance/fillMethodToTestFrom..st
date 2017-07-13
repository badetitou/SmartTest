as yet unclassified
fillMethodToTestFrom: aCollectionOfTests
	aCollectionOfTests
		do: [ :aMethod | 
			 self searchRelativeTestForMethod: aMethod  ]