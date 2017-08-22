accessing
testsForMethod: aCompiledMethod
	^ self methodToTest
		at: aCompiledMethod methodReference
		ifAbsentPut: [ Set new ]