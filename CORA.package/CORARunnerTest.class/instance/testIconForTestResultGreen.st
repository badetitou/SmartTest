tests
testIconForTestResultGreen 
	| case result  |
	case := self class selector: #noop.
	result := case run.
	self assert: (CORARunnerSettings runner iconForTestResultOf: result) equals: (self iconNamed: #testGreenIcon)