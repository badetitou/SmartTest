action
runCases: aTestCollection
	| aTestResult |
	aTestResult := TestResult new.
	aTestCollection do: [ :aTest |aTestResult runCase: aTest ].
	aTestResult updateResultsInHistory.
	self notifyTitle: 'CORA Execution' contents: aTestResult.
	^aTestResult