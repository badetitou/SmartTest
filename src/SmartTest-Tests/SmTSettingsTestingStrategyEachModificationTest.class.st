Class {
	#name : #SmTSettingsTestingStrategyEachModificationTest,
	#superclass : #SmTSettingsTestingStrategyTest,
	#category : #'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsTestingStrategyEachModificationTest >> getTestingStrategy [
	^ SmTTestingStrategyEachModification
]
