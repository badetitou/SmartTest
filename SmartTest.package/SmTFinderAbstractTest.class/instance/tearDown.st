helpers
tearDown

	"rest the cache"
	SmTBasicCacheStrategy new resetCache.
	super tearDown.
	