protocol
prepareInJenkinsForPackagesNamed: aCollectionOfPackageNamed
	| aCoraFinder |
	aCoraFinder := self new.
	aCoraFinder fillMethodToTestForPackagesNamed: aCollectionOfPackageNamed.
	aCoraFinder	fillClassToTestForPackagesNamed: aCollectionOfPackageNamed.
	CORAFinderSettings finder: self