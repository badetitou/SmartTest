settings
finder
	^ smTFinder ifNil: [ smTFinder := SmTSenderTestFinderStrategy ]