instance creation
getMethodsFor: aCompiledMethod
	^ self
		getTestMethodFromCompiledTestMethod: (CORAFinderSettings finder new methodsFor: aCompiledMethod)