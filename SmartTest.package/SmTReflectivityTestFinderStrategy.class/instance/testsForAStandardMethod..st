accessing
testsForAStandardMethod: aCompiledMethod
	self cache
		at: aCompiledMethod methodReference
		ifAbsent: [ self searchRelativeTestForMethod: aCompiledMethod ].
	^ (self testsForMethod: aCompiledMethod) collect: #compiledMethod