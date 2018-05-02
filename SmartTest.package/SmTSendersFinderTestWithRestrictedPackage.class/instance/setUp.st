initialization
setUp
	super setUp.
	self timeLimit: 15 seconds.
	smartFinder filter: (SmTSpecifyPackagesNameFilter packagesRegEx: 'SmartTest-Tests-Data') new