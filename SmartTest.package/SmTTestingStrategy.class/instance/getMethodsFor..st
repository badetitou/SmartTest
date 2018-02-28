instance creation
getMethodsFor: aCompiledMethod
	^ self getTestMethodFromCompiledTestMethod: (self finder methodsFor: aCompiledMethod)