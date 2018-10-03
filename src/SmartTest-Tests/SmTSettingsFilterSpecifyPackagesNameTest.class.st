Class {
	#name : #SmTSettingsFilterSpecifyPackagesNameTest,
	#superclass : #SmTSettingsFilterTest,
	#instVars : [
		'oldRegex'
	],
	#category : #'SmartTest-Tests-Settings'
}

{ #category : #running }
SmTSettingsFilterSpecifyPackagesNameTest >> dataForTestRegex [
	^ 'SmartTes*|StarWars'
]

{ #category : #running }
SmTSettingsFilterSpecifyPackagesNameTest >> filterStrategy [
	^ SmTSpecifyPackagesNameFilter 
]

{ #category : #running }
SmTSettingsFilterSpecifyPackagesNameTest >> setUp [
	super setUp.
	oldRegex := SmartFinder packagesRegex.
	SmartFinder packagesRegex: self dataForTestRegex 
]

{ #category : #running }
SmTSettingsFilterSpecifyPackagesNameTest >> tearDown [
	
	SmartFinder packagesRegex: oldRegex.
	super tearDown 
]

{ #category : #running }
SmTSettingsFilterSpecifyPackagesNameTest >> testChangeRegexWhenChanged [
	SmartFinder filter: self filterStrategy.
	self assert: SmartFinder settingInstance filter packagesRegex equals: self dataForTestRegex 
]
