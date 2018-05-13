running
setUp
	super setUp.
	smartFinder
		filter: (SmTSpecifyPackagesNameFilter packagesRegEx: 'SmartTest-Tests-Data') new