initialization
setUp
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
	"the cache is initially empty"
	smartFinder autoUpdateCache: false.
	smartFinder cacheStrategy: SmTBasicCacheStrategy new.
	smartFinder resetCache.
	smartFinder smtFinder: SmTTestCoverageTestFinderStrategy new.
	smartFinder autoUpdateCache: true