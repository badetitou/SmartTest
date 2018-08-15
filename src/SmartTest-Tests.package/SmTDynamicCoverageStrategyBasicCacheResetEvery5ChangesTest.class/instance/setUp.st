running
setUp
	"fill in the cache"

	| initialCache |
	super setUp.
	initialCache := self initCache.
	smartFinder cacheStrategy: (SmTBasicCacheResetEvery5ChangesStrategy new).
	smartFinder setCacheValues: initialCache.
	smartFinder smtFinder: SmTTestCoverageTestFinderStrategy new