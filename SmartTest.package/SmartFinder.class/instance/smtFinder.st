accessing
smtFinder
	^ smtFinder
		ifNil: [ smtFinder := SmTSenderTestFinderStrategy new
				filter: self filter;
				cache: self cacheClass;
				shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic ]