adding
addATest: aTestCase toMethod: aCompiledMethod
	(self methodToTest at: aCompiledMethod methodReference ifAbsentPut: Set new) add: (aTestCase class >> aTestCase selector)