accessing
testsForAStandardMethod: aCompiledMethod
	self methodToTest
		at: aCompiledMethod
		ifAbsent: [ self searchRelativeTestForMethod: aCompiledMethod ].
	^ self methodToTest at: aCompiledMethod ifAbsentPut: Set new