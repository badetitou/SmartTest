Class {
	#name : #SmTSettingsFilterIcebergTest,
	#superclass : #SmTSettingsFilterTest,
	#category : #'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsFilterIcebergTest >> filterStrategy [
	^ SmTIcebergLoadedPackagesFilter 
]
