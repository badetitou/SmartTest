Extension { #name : #TestCase }

{ #category : #'*SmartTest' }
TestCase class >> allTestMethods [
	^ self  methods select: [:aCompiledMethod| 
							   aCompiledMethod isTestMethod].
]

{ #category : #'*SmartTest' }
TestCase >> announce: anAnnouncementClass withResult: result [
	| event |
	self shouldAnnounce
		ifFalse: [ ^ self ].
		
	event := anAnnouncementClass asAnnouncement.
	event testCase: self.
	event testSelector: testSelector.
	event testResult: result.
	self generalAnnouncer announce: event
]

{ #category : #'*SmartTest' }
TestCase >> generalAnnouncer [
	^ self class generalAnnouncer
]

{ #category : #'*SmartTest' }
TestCase class >> generalAnnouncer [
	^ SmTAnnouncer announcer
]

{ #category : #'*SmartTest' }
TestCase >> methodReference [
	^ RGMethodDefinition class: self class selector: self selector
]

{ #category : #'*SmartTest' }
TestCase class >> shouldAnnounce [
	^ SmTAnnouncer shouldAnnounce 
]
