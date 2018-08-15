"
When a test is run by CORA. If it failled, nothing happen
"
Class {
	#name : #SmTRunnerStrategyNotice,
	#superclass : #SmTRunnerStrategy,
	#category : 'SmartTest-Runner'
}

{ #category : #action }
SmTRunnerStrategyNotice class >> runCase: aTestMethod notifyIcon: anIcon [
	| aTestResult |
	aTestResult := TestResult new.
	[ aTestResult runCase: aTestMethod ]
		ensure: [ anIcon labelGraphic: (self iconForTestResultOf: aTestResult) ].
	anIcon labelGraphic: (self iconForTestResultOf: aTestResult).
	aTestResult updateResultsInHistory.
	self notifyTitle: 'SmartTest Execution' contents: aTestResult.
	^aTestResult.
]
