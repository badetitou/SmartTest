tests-accessing
setUp

	super setUp.
	
	cache := CORAReflectivityTestFinderStrategy methodToTest.
	CORAReflectivityTestFinderStrategy methodToTest: Dictionary new.