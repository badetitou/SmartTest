accessing
methodModified: anAnnouncement
	
	[| listOfTest |
	listOfTest := SmTRules testFinder researchTestsForMethod: anAnnouncement newMethod. 
	self collector
		addAll: listOfTest.
	self updateUIAfterAddingMethod: listOfTest.] forkAt: 20 named: 'BigButton'