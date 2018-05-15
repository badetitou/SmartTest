running
setUp
	"Here we want to test the SmTRestrictedPackageFilter with the static strategy 'sendersFinder'. We look for the tests located in both SmartTestDataOutsideP1 and P2."
	super setUp.
	self timeLimit: 60 seconds.
	smartFinder filter: (SmTSpecifyPackagesNameFilter packagesRegex: 'SmartTestDataOutsideP1|SmartTestDataOutsideP2') new