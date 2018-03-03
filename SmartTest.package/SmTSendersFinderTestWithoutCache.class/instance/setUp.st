initialization
setUp
	super setUp.
	smartFinder cacheClass: SmTNoCacheStrategy new.
	cache := SmTNoCacheStrategy new