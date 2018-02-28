as yet unclassified
setUp

	super setUp.
	
	cache := SmTTestFinderStrategy methodToTest.
	SmTTestFinderStrategy methodToTest: Dictionary new.