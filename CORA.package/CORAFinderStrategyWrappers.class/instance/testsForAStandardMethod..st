accessing
testsForAStandardMethod: aCompiledMethod
	MethodsToTests at: aCompiledMethod name ifAbsent: [ self searchRelativeTestForMethod: aCompiledMethod ].
	^ MethodsToTests at: aCompiledMethod name .