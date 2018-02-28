protocol
defaultSizeOfResearchQueue: anInteger
	defaultSize := anInteger asInteger.
	[ self queue size > defaultSize ]
		whileTrue: [ self queue next ]