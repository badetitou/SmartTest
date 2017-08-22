accessing
colorForTestResultOf: aTestResult
	aTestResult hasErrors 
		ifTrue: [ ^ Color red ].
	aTestResult hasFailures 
		ifTrue: [ ^ Color yellow].
	aTestResult hasPassed
		ifTrue: [ ^ Color green ].
	^ Color gray