helpers
strategy
	^ SmTSenderTestFinderStrategy new filter: SmTDefaultClassPackagesFilter new; cache: SmTBasicCacheStrategy new.