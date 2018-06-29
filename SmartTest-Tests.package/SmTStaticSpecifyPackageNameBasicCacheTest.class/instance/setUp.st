running
setUp
	super setUp.
	smartFinder filter: (SmTSpecifyPackagesNameFilter packagesRegex: 'SmartTest-Tests-Data').
	smartFinder resetCache