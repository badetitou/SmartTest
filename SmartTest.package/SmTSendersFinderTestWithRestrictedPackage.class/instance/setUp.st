initialization
setUp
	super setUp.
	self timeLimit: 60 seconds.
	smartFinder filter: (SmTSpecifyPackagesNameFilter packagesRegEx: 'SmartTest-Tests-Data') new