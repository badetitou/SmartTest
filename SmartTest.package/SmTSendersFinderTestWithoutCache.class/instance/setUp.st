initialization
setUp
	super setUp.
	smartFinder cache: SmTNoCacheStrategy new.
	cache := SmTNoCacheStrategy new