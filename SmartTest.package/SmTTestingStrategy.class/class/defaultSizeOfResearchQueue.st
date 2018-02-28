protocol
defaultSizeOfResearchQueue
	^ defaultSize ifNil: [ defaultSize := 5 ]