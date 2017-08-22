tests
testIconForTestResultGreen 
	| case result  |
	case := self class selector: #noop.
	result := case run.
	self assert: (SmTRunnerSettings runner iconForTestResultOf: result) equals: (self iconNamed: #testGreenIcon)