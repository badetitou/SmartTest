"
We test if we correctly changed the regex when we changed it (or not) in the settings.
"
Class {
	#name : #SmTSettingsPackagesRegexTest,
	#superclass : #SmTSettingsTest,
	#instVars : [
		'oldRegex',
		'oldFilter'
	],
	#category : 'SmartTest-Tests-Settings'
}

{ #category : #testing }
SmTSettingsPackagesRegexTest class >> isAbstract [
	 ^ false
]

{ #category : #running }
SmTSettingsPackagesRegexTest >> dataForTestRegex [
	^ 'SmartTes*|StarWars'
]

{ #category : #running }
SmTSettingsPackagesRegexTest >> setUp [
	super setUp.
	
	oldRegex := SmTRules packagesRegex.
	oldFilter := SmTRules filter.
]

{ #category : #running }
SmTSettingsPackagesRegexTest >> tearDown [
	SmTRules packagesRegex: oldRegex.
	SmTRules filter: oldFilter.
	super tearDown
]

{ #category : #tests }
SmTSettingsPackagesRegexTest >> testChangeRegexSmTSpecifyPackagesNameFilter [
	SmTRules filter: SmTSpecifyPackagesNameFilter.
	SmTRules packagesRegex: self dataForTestRegex.
	self assert: SmTRules testFinder filter packagesRegex equals: self dataForTestRegex
]
