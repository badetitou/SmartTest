action
runCases: aTestCollection
	| aTestResult |
	aTestResult := TestResult new.
	aTestCollection do: [ :aTest |aTestResult runCase: aTest ].
	aTestResult updateResultsInHistory.
	^aTestResult 