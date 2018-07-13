running
setUp
	"fill in the cache"

	| initialCache |
	super setUp.
	smartFinder := SmartFinder new.
	initialCache := self initCache.
	smartFinder cacheStrategy: (self strategyTested new).
	smartFinder setCacheValues: initialCache.
	smartFinder smtFinder: SmTTestCoverageTestFinderStrategy new