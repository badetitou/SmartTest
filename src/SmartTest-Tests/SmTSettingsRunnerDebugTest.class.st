Class {
	#name : #SmTSettingsRunnerDebugTest,
	#superclass : #SmTSettingsRunnerTest,
	#category : #'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsRunnerDebugTest >> runnerStrategy [
	^ SmTRunnerStrategyDebug
]
