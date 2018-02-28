settings
finder
	^ SmTFinder ifNil: [ SmTFinder := SmTSenderTestFinderStrategy ]