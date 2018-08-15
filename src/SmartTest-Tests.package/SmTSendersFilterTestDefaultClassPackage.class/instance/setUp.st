running
setUp
"Here we want to test the SmTDefaultPackagesFilter with the static strategy 'sendersFinder' "
	super setUp.
	smartFinder filter: SmTDefaultClassPackagesFilter new.