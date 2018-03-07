protocol
enableListenerTestCase
	SmTAnnouncer announcer weak when: TestCaseStarted send: #testCaseStarted: to: self.
	SmTAnnouncer announcer weak when: TestCaseEnded send: #testCaseEnded: to: self