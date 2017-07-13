accessing
findCompiledMethodFromMessageNode: aMessageNode
	^ (aMessageNode receiver name asClass lookupSelector: aMessageNode selector)
		ifNil: [ ^ aMessageNode receiver name asClass class lookupSelector: aMessageNode selector ]