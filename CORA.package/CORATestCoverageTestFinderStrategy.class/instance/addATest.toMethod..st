adding
addATest: aTestCase toMethod: aCompiledMethod
	(self testsForMethod: aCompiledMethod) add: (aTestCase class >> aTestCase selector)