*SmartTest
announce: anAnnouncementClass withResult: result
	| event |
	
	event := anAnnouncementClass asAnnouncement.
	event testCase: self.
	event testSelector: testSelector.
	event testResult: result.
	 self generalAnnouncer announce: event