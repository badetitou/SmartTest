tests
testIconForTestResultGreen 
	| case result  |
	case := self class selector: #noop.
	result := case run.
	self assert: (runner iconForTestResultOf: result) equals: (self iconNamed: #testGreenIcon)