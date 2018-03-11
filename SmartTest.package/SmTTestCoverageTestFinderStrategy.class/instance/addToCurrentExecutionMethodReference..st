adding
addToCurrentExecutionMethodReference: aMethodReference
	| he |
	[ he := thisContext contextStack collect: [ :a | a method methodReference ] ] on: KeyNotFound do: [^self].
	(he includes: self currentTestExecution methodReference)
		ifTrue: [ self addATest: self currentTestExecution toMethodReference: aMethodReference ]