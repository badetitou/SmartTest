accessing
addATest: aTestCase toMethod: aCompiledMethod
	(self testsForMethod: aCompiledMethod) add: aTestCase