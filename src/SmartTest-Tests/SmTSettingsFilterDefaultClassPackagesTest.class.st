Class {
	#name : #SmTSettingsFilterDefaultClassPackagesTest,
	#superclass : #SmTSettingsFilterTest,
	#category : #'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsFilterDefaultClassPackagesTest >> filterStrategy [
	^ SmTDefaultClassPackagesFilter 
]
