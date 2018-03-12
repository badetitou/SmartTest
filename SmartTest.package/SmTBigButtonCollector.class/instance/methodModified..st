accessing
methodModified: anAnnouncement
	| listOfTest |
	listOfTest := (SmTRules finder new methodsFor: anAnnouncement newMethod).
	self collector
		addAll: listOfTest.
	self updateUIAfterAddingMethod: listOfTest.