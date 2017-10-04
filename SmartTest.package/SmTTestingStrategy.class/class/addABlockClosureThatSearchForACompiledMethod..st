protocol
addABlockClosureThatSearchForACompiledMethod: aBlockClosure
	self queue size >= SmTResearchQueueSize defaultSizeOfResearchQueue
		ifTrue: [ self queue next value: true ].
	self queue nextPut: aBlockClosure.
	self researchProcess isTerminated
		ifTrue: [ self initializeResearchProcess ]