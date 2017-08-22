accessing
iconForTestResultOf: aTestResult
	aTestResult hasErrors 
		ifTrue: [ ^ self iconNamed: #testRedIcon ].
	aTestResult hasFailures 
		ifTrue: [ ^ self iconNamed: #testYellowIcon ].
	aTestResult hasPassed
		ifTrue: [ ^ self iconNamed: #testGreenIcon ].
	^ self iconNamed: #testNotRunIcon.