settings
runner
	^ smTTestRunner ifNil: [ smTTestRunner := SmTRunnerStrategySmart ]