api
addATest: aTestCase toMethod: aCompiledMethod
	(self searchTestsForMethod: aCompiledMethod)
		add: aTestCase methodReference