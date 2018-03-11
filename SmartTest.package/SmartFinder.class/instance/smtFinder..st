accessing
smtFinder: aSmTTestFinderStrategy
	smtFinder := aSmTTestFinderStrategy.
	smtFinder
		filter: self filter;
		cache: self cacheClass;
		shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic.
	self testingStrategy finder: aSmTTestFinderStrategy