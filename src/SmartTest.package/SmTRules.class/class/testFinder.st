instance creation
testFinder
	^ SmTSmartFinder ifNil: [ SmTSmartFinder := SmartFinder new
		cacheStrategy: self cacheStrategy new;
		filter: self filter new;
		testRunner: self runner;
		smtFinder: self finder new;
		testingStrategy: self strategy new;
		shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic ]