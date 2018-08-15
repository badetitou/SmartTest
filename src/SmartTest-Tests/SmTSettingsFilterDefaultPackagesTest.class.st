Class {
	#name : #SmTSettingsFilterDefaultPackagesTest,
	#superclass : #SmTSettingsFilterTest,
	#category : 'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsFilterDefaultPackagesTest >> filterStrategy [
	^ SmTDefaultPackagesFilter 
]
