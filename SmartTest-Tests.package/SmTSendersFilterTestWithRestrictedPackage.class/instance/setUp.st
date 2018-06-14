running
setUp
	"Here we want to test the SmTRestrictedPackageFilter with the static strategy 'sendersFinder'. We only look for the tests located in SmartTestDataOutsideP1."

	super setUp.
	self timeLimit: 60 seconds.
	smartFinder filter: (SmTSpecifyPackagesNameFilter packagesRegex: 'SmartTestDataOutsideP1')