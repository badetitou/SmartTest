accessing
iconForTestFromTestCaseHistory: aTestCase
	(aTestCase class methodRaisedError: aTestCase selector)
		ifTrue: [ ^ #testRedIcon ].
	(aTestCase class methodFailed: aTestCase selector)
		ifTrue: [ ^ #testYellowIcon ].
	(aTestCase class methodPassed: aTestCase selector)
		ifTrue: [ ^ #testGreenIcon ].
	^ #testNotRunIcon