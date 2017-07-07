tests
testIconForTestResultYellow
	| case result |
	case := self class selector: #fail.
	result := case run.
	self
		assert: (CORARunnerSettings runner iconForTestResultOf: result)
		equals: (self iconNamed: #testYellowIcon)