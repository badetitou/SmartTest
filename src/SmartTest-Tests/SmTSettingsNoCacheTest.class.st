Class {
	#name : #SmTSettingsNoCacheTest,
	#superclass : #SmTSettingsCacheTest,
	#category : #'SmartTest-Tests-Settings'
}

{ #category : #settings }
SmTSettingsNoCacheTest >> cacheStrategy [
	^ SmTNoCacheStrategy 
]
