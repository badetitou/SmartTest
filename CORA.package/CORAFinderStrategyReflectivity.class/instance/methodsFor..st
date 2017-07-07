accessing
methodsFor: aCompiledMethod
	^ self methodToTest at: aCompiledMethod ifAbsent: [ #() ]