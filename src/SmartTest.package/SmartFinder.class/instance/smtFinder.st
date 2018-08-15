accessing
smtFinder
	^ smtFinder
		ifNil: [ smtFinder := SmTSenderTestFinderStrategy new
				filter: self filter;
				cache: self cacheStrategy;
				shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic;
				yourself  ]