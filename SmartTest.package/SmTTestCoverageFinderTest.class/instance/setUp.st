helpers
setUp
	"fill in the cache"

	| initialCache |
	super setUp.
	initialCache := self initCache.
	smartFinder cache: (SmTBasicCacheStrategy new setCache: initialCache).
	smartFinder smtFinder: SmTTestCoverageTestFinderStrategy new