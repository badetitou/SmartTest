initialization
setUp
	"fill in the cache"

	| initialCache |
	super setUp.
	initialCache := self initCache.
	smartFinder cacheClass: (SmTBasicCacheStrategy new setCache: initialCache).
	smartFinder smtFinder: SmTReflectivityTestFinderStrategy new