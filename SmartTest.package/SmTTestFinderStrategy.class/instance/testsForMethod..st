accessing
testsForMethod: aCompiledMethod
	^ self methodToTest relevantTestsFor: aCompiledMethod 
		"at: aCompiledMethod methodReference
		ifAbsentPut: [ Set new ]"