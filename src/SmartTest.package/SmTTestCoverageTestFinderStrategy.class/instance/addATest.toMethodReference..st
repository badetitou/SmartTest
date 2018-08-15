adding
addATest: aTestCase toMethodReference: aMethodReference
	(self searchTestsForMethodReference: aMethodReference)
		add: aTestCase methodReference