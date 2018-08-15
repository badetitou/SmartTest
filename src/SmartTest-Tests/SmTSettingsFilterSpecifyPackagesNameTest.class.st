Class {
	#name : #SmTSettingsFilterSpecifyPackagesNameTest,
	#superclass : #SmTSettingsFilterTest,
	#instVars : [
		'oldRegex'
	],
	#category : 'SmartTest-Tests-Settings'
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
	oldRegex := SmTRules packagesRegex.
	SmTRules packagesRegex: self dataForTestRegex 
]

{ #category : #running }
SmTSettingsFilterSpecifyPackagesNameTest >> tearDown [
	
	SmTRules packagesRegex: oldRegex.
	super tearDown 
]

{ #category : #running }
SmTSettingsFilterSpecifyPackagesNameTest >> testChangeRegexWhenChanged [
	SmTRules filter: self filterStrategy.
	self assert: SmTRules testFinder filter packagesRegex equals: self dataForTestRegex 
]
