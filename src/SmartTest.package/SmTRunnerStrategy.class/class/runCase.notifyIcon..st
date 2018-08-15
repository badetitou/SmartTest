action
runCase: aTestMethod notifyIcon: anIcon
	| aTestResult |

	aTestResult := TestResult new.
	[ aTestResult runCaseForDebug: aTestMethod ]
		ensure: [ anIcon labelGraphic: (self iconForTestResultOf: aTestResult) ].
	anIcon labelGraphic: (self iconForTestResultOf: aTestResult).
	aTestResult updateResultsInHistory.
	self notifyTitle: 'SmartTest Execution' contents: aTestResult.
	^aTestResult.