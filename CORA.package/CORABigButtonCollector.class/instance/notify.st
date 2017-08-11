accessing
notify
	| aTestResult |
	aTestResult := CORARunnerSettings runner
		runCases:
			(self collector
				collect: [ :aMethodReference | aMethodReference methodClass selector: aMethodReference selector ]).
	self collector: (self collector reject: [ :a | ((TestResult historyAt: a methodClass) at: #passed) includes: a selector ]).
	self changeColorFromTestResult: aTestResult.
	morph fillFailedTestListFromTestResult: aTestResult.