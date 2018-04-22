initialization
setUp
	super setUp.
	self timeLimit: 15 seconds.
	smartFinder filter: (SmTSpecifyPackageNameFilter packagesRegEx: 'SmartTest-Tests-Data') new