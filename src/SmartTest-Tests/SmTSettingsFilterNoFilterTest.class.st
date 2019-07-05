Class {
	#name : #SmTSettingsFilterNoFilterTest,
	#superclass : #SmTSettingsFilterTest,
	#category : #'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsFilterNoFilterTest >> filterStrategy [
	^ SmTNoFilter 
]
