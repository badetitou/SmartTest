accessing
testsForAStandardMethod: aCompiledMethod
self halt.
	self methodToTest
		at: aCompiledMethod methodReference
		ifAbsent: [ self searchRelativeTestForMethod: aCompiledMethod ].
	^ self testsForMethod: aCompiledMethod