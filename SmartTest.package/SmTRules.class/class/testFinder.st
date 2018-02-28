instance creation
testFinder
	^ SmartFinder new
		cache: self cache new;
		filter: self filter new;
		testRunner: self runner new;
		smtFinder: self finder new;
		testingStrategy: self strategy new