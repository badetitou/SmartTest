initialization
setUp
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
	"the cache is initially empty"
	smartFinder cache: (SmTBasicCacheStrategy new setCache: nil).
	smartFinder smtFinder: SmTTestCoverageTestFinderStrategy new