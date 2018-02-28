helpers
strategy
	^ SmTTestCoverageTestFinderStrategy new
		filter: SmTDefaultClassPackagesFilter new;
		cache: SmTBasicCacheStrategy new