Class {
	#name : #SmTSettingsTestingStrategyNeverTest,
	#superclass : #SmTSettingsTestingStrategyTest,
	#category : #'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsTestingStrategyNeverTest >> getTestingStrategy [
	^ SmTTestingStrategyNever
]
