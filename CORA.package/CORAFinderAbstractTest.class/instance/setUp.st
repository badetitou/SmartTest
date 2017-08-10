helpers
setUp

	super setUp.
	
	cache := CORATestFinderStrategy methodToTest.
	CORATestFinderStrategy methodToTest: Dictionary new.