api
testsForAStandardMethod: aCompiledMethod
	self searchRelativeTestForMethod: aCompiledMethod.
	^ self testsForMethod: aCompiledMethod