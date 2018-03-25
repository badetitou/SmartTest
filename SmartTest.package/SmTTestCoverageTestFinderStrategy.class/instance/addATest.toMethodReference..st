adding
addATest: aTestCase toMethodReference: aMethodReference
	(self testsForMethodReference: aMethodReference)
		add: aTestCase methodReference