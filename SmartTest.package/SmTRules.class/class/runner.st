settings
runner
	^ SmTTestRunner ifNil: [ SmTTestRunner := SmTRunnerStrategySmart ]