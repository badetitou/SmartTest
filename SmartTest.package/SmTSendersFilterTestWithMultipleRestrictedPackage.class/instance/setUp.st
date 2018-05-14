running
setUp
	"Here we want to test the SmTDefaultPackagesFilter with the static strategy 'sendersFinder' "
	super setUp.
	self timeLimit: 60 seconds.
	smartFinder filter: (SmTSpecifyPackagesNameFilter packagesRegEx: 'SmartTestDataOutsideP1,SmartTestDataOutsideP2') new