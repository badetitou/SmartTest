private
searchTestsForATestMethod: aCompiledMethod
	^ aCompiledMethod isTestMethod
				ifTrue: [{aCompiledMethod methodReference}]
				ifFalse: [{}].