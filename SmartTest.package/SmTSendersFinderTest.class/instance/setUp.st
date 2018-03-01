initialization
setUp
	super setUp.
	SmTBasicCacheStrategy new setCache: Dictionary new.
	cache := SmTBasicCacheStrategy new methodsToTests.
	