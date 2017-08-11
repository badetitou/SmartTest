accessing
notify
	| aTestResult |
	aTestResult := CORARunnerSettings runner
		runCases:
			(self collector
				collect: [ :aMethodReference | aMethodReference methodClass selector: aMethodReference selector ]).
	morph color: Color gray.
	aTestResult passedCount > 0
		ifTrue: [ morph color: Color green ].
	aTestResult hasFailures
		ifTrue: [ morph color: Color yellow ].
	aTestResult hasErrors
		ifTrue: [ morph color: Color red ].
	self flush