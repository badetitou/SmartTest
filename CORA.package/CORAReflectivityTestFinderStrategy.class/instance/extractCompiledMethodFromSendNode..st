accessing
extractCompiledMethodFromSendNode: aSendNode
	" (self class environment at: aSendNode receiver methodNode compiledMethod) lookupSelector: aSendNode selector"
	^ aSendNode receiver isSelf
		ifTrue: [ aSendNode receiver methodNode compiledMethod ]
		ifFalse: [ (self class environment at: aSendNode receiver name) class lookupSelector: aSendNode selector ]