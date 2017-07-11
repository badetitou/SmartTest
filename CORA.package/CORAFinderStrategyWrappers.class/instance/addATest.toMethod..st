accessing
addATest: aTestCase toMethod: aCompiledMethod
	(self methodToTest at: aCompiledMethod name ifAbsentPut: Set new) add: aTestCase asString