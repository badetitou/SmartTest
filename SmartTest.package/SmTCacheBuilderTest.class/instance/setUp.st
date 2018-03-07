initialization
setUp
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
	"the cache is initially empty"
	smartFinder cacheClass: (SmTBasicCacheStrategy new setCache: nil).
	smartFinder smtFinder: SmTTestCoverageFinderTest new.
	smartFinder autoUpdateCache: true