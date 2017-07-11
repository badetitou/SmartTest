accessing
testsForATestMethod: aCompiledMethod
	^ aCompiledMethod isTestMethod
				ifTrue: [{aCompiledMethod}]
				ifFalse: [{}].
	