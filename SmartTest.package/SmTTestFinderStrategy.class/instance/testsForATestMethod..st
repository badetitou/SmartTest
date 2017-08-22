accessing
testsForATestMethod: aCompiledMethod
	^ aCompiledMethod isTestMethod
				ifTrue: [{aCompiledMethod methodReference}]
				ifFalse: [{}].