initialization
setUp
	super setUp.
	smartFinder cacheStrategy: SmTNoCacheStrategy new.
	cache := SmTNoCacheStrategy new