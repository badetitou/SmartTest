accessing
activated: aSelector
	aSelector ifTrue: [ self enable ] ifFalse: [ self disable ].