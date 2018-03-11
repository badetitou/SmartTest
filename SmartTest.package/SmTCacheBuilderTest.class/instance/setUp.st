initialization
setUp
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
	"the cache is initially empty"
	smartFinder autoUpdateCache: false.
	smartFinder cacheClass: (SmTBasicCacheStrategy new setCache: nil).
	smartFinder smtFinder: SmTTestCoverageTestFinderStrategy new.
	smartFinder autoUpdateCache: true