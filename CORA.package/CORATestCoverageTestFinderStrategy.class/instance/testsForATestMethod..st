API
testsForATestMethod: aCompiledMethod
	
	aCompiledMethod isTestMethod ifFalse: [ ^ #() ].
	
	^ { aCompiledMethod }
	