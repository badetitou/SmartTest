Class {
	#name : #SmTSettingsTestingStrategyFiveMinutesTest,
	#superclass : #SmTSettingsTestingStrategyTest,
	#category : 'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsTestingStrategyFiveMinutesTest >> getTestingStrategy [
	^ SmTTestingStrategyFiveMinutes 
]
