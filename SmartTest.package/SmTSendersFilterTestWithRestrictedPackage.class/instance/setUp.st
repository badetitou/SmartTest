running
setUp
	"Here we want to test the SmTDefaultPackagesFilter with the static strategy 'sendersFinder' "
	super setUp.
	self timeLimit: 60 seconds.
	self flag: 'Because the problem with the regex is not corrected yet, those tests will fail but we leave it as it to show that there is a problem'.
	smartFinder filter: (SmTSpecifyPackagesNameFilter packagesRegex: 'SmartTestDataOutsideP1') new
