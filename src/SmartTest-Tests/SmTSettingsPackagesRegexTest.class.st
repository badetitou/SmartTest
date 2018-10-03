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
	#category : #'SmartTest-Tests-Settings'
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
	
	oldRegex := SmartFinder packagesRegex.
	oldFilter := SmartFinder filter.
]

{ #category : #running }
SmTSettingsPackagesRegexTest >> tearDown [
	SmartFinder packagesRegex: oldRegex.
	SmartFinder filter: oldFilter.
	super tearDown
]

{ #category : #tests }
SmTSettingsPackagesRegexTest >> testChangeRegexSmTSpecifyPackagesNameFilter [
	SmartFinder filter: SmTSpecifyPackagesNameFilter.
	SmartFinder packagesRegex: self dataForTestRegex.
	self assert: SmartFinder settingInstance filter packagesRegex equals: self dataForTestRegex
]
