tests
testIconForTestResultWhite
	| result | 
	result := TestResult new.
	self
		assert: (runner iconForTestResultOf: result)
		equals: (self iconNamed: #testGreenIcon)