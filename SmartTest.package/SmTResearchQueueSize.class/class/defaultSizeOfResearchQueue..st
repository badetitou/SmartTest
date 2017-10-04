as yet unclassified
defaultSizeOfResearchQueue: anInteger
	defaultSize := anInteger asInteger.
	[ SmTTestingStrategy queue size > defaultSize ]
		whileTrue: [ SmTTestingStrategy queue next ]