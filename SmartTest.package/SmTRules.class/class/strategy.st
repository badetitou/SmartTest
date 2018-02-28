settings
strategy
	^ SmTClassTestingStrategy
		ifNil: [ SmTClassTestingStrategy := SmTTestingStrategyEachModification ]