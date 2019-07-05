"
When a test is run by CORA. If it failled, the debugger will open.
"
Class {
	#name : #SmTRunnerStrategyDebug,
	#superclass : #SmTRunnerStrategy,
	#category : #'SmartTest-Runner'
}

{ #category : #action }
SmTRunnerStrategyDebug class >> runCases: aTestCollection [
	| aTestResult |
	aTestResult := TestResult new.
	aTestCollection do: [ :aTest |aTestResult runCaseForDebug: aTest ].
	aTestResult updateResultsInHistory.
	self notifyTitle: 'SmartTest Execution' contents: aTestResult.
	^aTestResult 
]
