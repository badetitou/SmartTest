tests
testIconForTestResultWhite
	| result | 
	result := TestResult new.
	self
		assert: (SmTRunnerSettings runner iconForTestResultOf: result)
		equals: (self iconNamed: #testGreenIcon)