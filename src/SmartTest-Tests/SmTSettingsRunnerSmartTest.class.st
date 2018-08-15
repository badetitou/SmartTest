Class {
	#name : #SmTSettingsRunnerSmartTest,
	#superclass : #SmTSettingsRunnerTest,
	#category : 'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsRunnerSmartTest >> runnerStrategy [
	^ SmTRunnerStrategySmart
]
