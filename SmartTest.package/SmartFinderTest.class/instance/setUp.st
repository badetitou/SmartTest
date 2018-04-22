initialization
setUp
	smartFinder := SmartFinder new
		cacheStrategy: SmTBasicCacheStrategy new;
		filter: SmTNullPackagesFilter new;
		testRunner: SmTRunnerStrategyDebug;
		smtFinder: SmTSenderTestFinderStrategy new;
		testingStrategy: SmTTestingStrategyEachModification new;
		shouldTryToFindTestForDynamic: false