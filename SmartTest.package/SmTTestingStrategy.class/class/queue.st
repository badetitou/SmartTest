protocol
queue
	self researchProcess isTerminated ifTrue: [ self initializeResearchProcess  ].
	^ queue ifNil: [ queue := SharedQueue new. ]