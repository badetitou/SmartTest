accessing
extractCompiledMethodFromReceiver: receiver andSelector: selector
	" (self class environment at: aSendNode receiver methodNode compiledMethod) lookupSelector: aSendNode selector"
	^  receiver class lookupSelector: selector 