accessing
testsForMethod: aCompiledMethod
	^ self cache relevantTestsFor: aCompiledMethod 
		"at: aCompiledMethod methodReference
		ifAbsentPut: [ Set new ]"