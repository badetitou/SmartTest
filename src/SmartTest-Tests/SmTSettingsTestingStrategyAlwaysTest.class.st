Class {
	#name : #SmTSettingsTestingStrategyAlwaysTest,
	#superclass : #SmTSettingsTestingStrategyTest,
	#category : 'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsTestingStrategyAlwaysTest >> getTestingStrategy [
	^ SmTTestingStrategyAlways 
]
