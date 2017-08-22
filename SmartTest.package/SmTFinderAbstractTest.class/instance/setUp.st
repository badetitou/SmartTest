helpers
setUp

	super setUp.
	
	cache := SmTTestFinderStrategy methodToTest.
	SmTTestFinderStrategy methodToTest: Dictionary new.