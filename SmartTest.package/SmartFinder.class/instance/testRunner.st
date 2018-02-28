accessing
testRunner
	^ testRunner ifNil: [ testRunner := SmTTestRunner new ]