running
setUp
	super setUp.
	self timeLimit: 15 seconds.
	smartFinder cacheStrategy: SmTNoCacheStrategy new.
	cache := SmTNoCacheStrategy new