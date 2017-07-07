tests
testIconForTestResultWhite
	| result | 
	result := TestResult new.
	self
		assert: (CORARunnerSettings runner iconForTestResultOf: result)
		equals: (self iconNamed: #testGreenIcon)