tests
testIconForTestResultYellow
	| case result |
	case := self class selector: #fail.
	result := case run.
	self
		assert: (runner iconForTestResultOf: result)
		equals: (self iconNamed: #testYellowIcon)