accessing
methodModified: anAnnouncement
	
	[| listOfTest |
	listOfTest := (SmTRules testFinder findTestsForMethod: anAnnouncement newMethod) collect: #methodReference. 
	self collector
		addAll: listOfTest.
	self updateUIAfterAddingMethod: listOfTest.] forkAt: 20 named: 'BigButton'