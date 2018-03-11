adding
addToCurrentExecutionMethodReference: aMethodReference
	| he |
	he := thisContext contextStack select: #isNotNil thenCollect: [ :a | a method methodReference ].
	(he includes: self currentTestExecution methodReference)
		ifTrue: [ self addATest: self currentTestExecution toMethodReference: aMethodReference ]