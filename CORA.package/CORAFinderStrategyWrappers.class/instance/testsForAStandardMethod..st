accessing
testsForAStandardMethod: aCompiledMethod
	self methodToTest
		at: aCompiledMethod methodReference
		ifAbsent: [ self searchRelativeTestForMethod: aCompiledMethod ].
	^ self methodToTest at: aCompiledMethod methodReference