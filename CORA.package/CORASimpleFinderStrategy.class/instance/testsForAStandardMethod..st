accessing
testsForAStandardMethod: aCompiledMethod
	(self filter: (aCompiledMethod senders collect: #compiledMethod))
		do: [ :aSendCompiledMethod | 
			(self collectionOfMethod includes: aSendCompiledMethod)
				ifFalse: [ self testsForAStandardMethod: aSendCompiledMethod ] ].
	^ self collectionOfMethod