initialization
setUp

	super setUp.
	
	cache := CORAWrappersTestFinderStrategy methodToTest.
	CORAWrappersTestFinderStrategy methodToTest: Dictionary new.