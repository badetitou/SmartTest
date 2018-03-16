adding
addToCurrentExecutionMethodReference: aMethodReference
	| he |
	he := thisContext contextStack reject: [ :c | c selector = #DoIt ] thenCollect: [ :a | a method methodReference ].
	((he includes: self currentTestExecution methodReference) or: [(he collect: #selector) includes: #buildCacheFromTestSuite:])
		ifTrue: [ self addATest: self currentTestExecution toMethodReference: aMethodReference ]