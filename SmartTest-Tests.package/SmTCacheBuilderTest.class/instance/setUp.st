initialization
setUp
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
	"the cache is initially empty"
	smartFinder autoUpdateCache: false.
	smartFinder cacheStrategy: self cacheStrategy new.
	smartFinder resetCache.
	smartFinder smtFinder: self dynamicFinder.
	smartFinder autoUpdateCache: true