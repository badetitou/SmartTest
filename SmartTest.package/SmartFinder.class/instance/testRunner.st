accessing
testRunner
	^ testRunner ifNil: [ testRunner := SmTRunnerStrategySmart ]