helpers
setUp
	"fill in the cache"

	| initialCache |
	super setUp.
	initialCache := self initCache.
	smartFinder cacheClass: (SmTBasicCacheStrategy new).
	smartFinder setCacheValues: initialCache.
	smartFinder smtFinder: SmTTestCoverageTestFinderStrategy new