accessing
addATest: aTestCase toMethod: aCompiledMethod
	(self methodToTest at: aCompiledMethod ifAbsentPut: Set new) add: (aTestCase class >> aTestCase selector)