api
searchTestsForAStandardMethod: aCompiledMethod
	self searchRelativeTestForMethod: aCompiledMethod.
	^ self searchTestsForMethod: aCompiledMethod