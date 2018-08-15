settings
strategy
	^ smTClassTestingStrategy ifNil: [ smTClassTestingStrategy := SmTTestingStrategyEachModification ]