accessing
methodModified: anAnnouncement
	self collector
		addAll: (SmTFinderSettings finder new methodsFor: anAnnouncement newMethod).
	self updateNumberOfTheProgressCircle