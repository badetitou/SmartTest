instance creation
testFinder
	^ SmTSmartFinder ifNil: [ SmTSmartFinder := SmartFinder new
		cacheClass: self cacheClass new;
		filter: self filter new;
		testRunner: self runner;
		smtFinder: self finder new;
		testingStrategy: self strategy new;
		shouldTryToFindTestForDynamic: self shouldTryToFindTestForDynamic ]