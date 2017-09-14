accessing
methodModified: anAnnouncement
	| listOfTest |
	listOfTest := (SmTFinderSettings finder new methodsFor: anAnnouncement newMethod).
	self collector
		addAll: listOfTest.
	self updateUIAfterAddingMethod: listOfTest.