action
runCases: aTestCollection notifyIcon: anIcon
	| aTestResult |
	aTestResult := self runCases: aTestCollection.
	anIcon labelGraphic: (self iconForTestResultOf: aTestResult ) .
	^aTestResult