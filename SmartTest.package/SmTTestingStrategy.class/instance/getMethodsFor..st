instance creation
getMethodsFor: aCompiledMethod
	^ self
		getTestMethodFromCompiledTestMethod: (SmTFinderSettings finder new methodsFor: aCompiledMethod)