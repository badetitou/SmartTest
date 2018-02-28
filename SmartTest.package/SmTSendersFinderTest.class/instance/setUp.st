initialization
setUp
	super setUp.
	cache := SmTBasicCacheStrategy new methodsToTests.
	SmTBasicCacheStrategy new setCache: Dictionary new