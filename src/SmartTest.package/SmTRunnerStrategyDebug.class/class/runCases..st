action
runCases: aTestCollection
	| aTestResult |
	aTestResult := TestResult new.
	aTestCollection do: [ :aTest |aTestResult runCaseForDebug: aTest ].
	aTestResult updateResultsInHistory.
	self notifyTitle: 'SmartTest Execution' contents: aTestResult.
	^aTestResult 