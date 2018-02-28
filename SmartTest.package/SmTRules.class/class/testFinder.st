instance creation
testFinder
	^ SmartFinder new
		cache: self cacheClass new;
		filter: self filter new;
		testRunner: self runner;
		smtFinder: self finder new;
		testingStrategy: self strategy new