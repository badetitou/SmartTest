"
These tests are here to assert that when we change the settings of SmartTest in the environnement, they are indeed changed.
"
Class {
	#name : #SmTSettingsTest,
	#superclass : #TestCase,
	#instVars : [
		'oldSettings'
	],
	#category : #'SmartTest-Tests-Settings'
}

{ #category : #testing }
SmTSettingsTest class >> isAbstract [
	^ true
]

{ #category : #running }
SmTSettingsTest >> setUp [
	super setUp.
	oldSettings := SmartFinder settingInstance
]

{ #category : #running }
SmTSettingsTest >> tearDown [
	SmartFinder settingInstance:  oldSettings.
	super tearDown
]
