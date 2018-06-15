private
searchTestsForAStandardMethod: aCompiledMethod
	self cache
		at: aCompiledMethod methodReference
		ifAbsent: [ self searchRelativeTestForMethod: aCompiledMethod ].
	^ (self searchTestsForMethod: aCompiledMethod) collect: #compiledMethod