initialization
setUp
	smartFinder := SmartFinder new
		cacheStrategy: SmTBasicCacheStrategy new;
		filter: SmTNoFilter new;
		testRunner: SmTRunnerStrategyDebug;
		smtFinder: SmTSenderTestFinderStrategy new;
		testingStrategy: SmTTestingStrategyEachModification new;
		shouldTryToFindTestForDynamic: false