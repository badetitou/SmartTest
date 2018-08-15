accessing
smtFinder: aSmTTestFinderStrategy
	smtFinder := aSmTTestFinderStrategy.
	smtFinder
		filter: self filter;
		cache: self cacheStrategy;
		shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic.
	self testingStrategy finder: aSmTTestFinderStrategy