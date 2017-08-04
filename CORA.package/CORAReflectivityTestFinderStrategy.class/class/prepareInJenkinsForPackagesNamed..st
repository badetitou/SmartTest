accessing
prepareInJenkinsForPackagesNamed: aCollectionOfPackageNamed
	| aCORAReflectivityFinder listOfTestsMethod |
	aCORAReflectivityFinder := self new.
	listOfTestsMethod := Smalltalk allTestMethods reject: [ :aTestMethod | aCORAReflectivityFinder isCORAMethodBlacklisted: aTestMethod  ].
	listOfTestsMethod do: [ :aAvailableTestMethod | aCORAReflectivityFinder installLinkAndRunTest: aAvailableTestMethod ].
	CORAFinderSettings finder: self