initialization
setUp

	super setUp.
	
	cache := CORATestCoverageTestFinderStrategy methodToTest.
	CORATestCoverageTestFinderStrategy methodToTest: Dictionary new.