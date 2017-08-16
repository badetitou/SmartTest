action
runCase: aTestMethod notifyIcon: anIcon
	| aTestResult |
	aTestResult := TestResult new.
	[ aTestResult runCase: aTestMethod ]
		ensure: [ anIcon labelGraphic: (self iconForTestResultOf: aTestResult) ].
	anIcon labelGraphic: (self iconForTestResultOf: aTestResult).
	aTestResult updateResultsInHistory.
	self notifyTitle: 'CORA Execution' contents: aTestResult.
	^aTestResult.