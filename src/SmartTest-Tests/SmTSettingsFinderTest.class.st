Class {
	#name : #SmTSettingsFinderTest,
	#superclass : #SmTSettingsTest,
	#category : #'SmartTest-Tests-Settings'
}

{ #category : #testing }
SmTSettingsFinderTest class >> isAbstract [
	^ self = SmTSettingsFinderTest 
]

{ #category : #running }
SmTSettingsFinderTest >> finderStrategy [
	self subclassResponsibility 
]

{ #category : #tests }
SmTSettingsFinderTest >> testChangeFinderStrategy [
	"Test changement of the runner in the setting (throught SmTRules methods)"

	SmartFinder finder: self finderStrategy.
	self assert: (SmartFinder settingInstance smtFinder isKindOf: self finderStrategy).
	self assert: (SmartFinder settingInstance smtFinder filter isKindOf: SmartFinder filter).
	self assert: (SmartFinder settingInstance smtFinder cache isKindOf: SmartFinder cacheStrategy).
	self assert: (SmartFinder settingInstance smtFinder filter isKindOf: SmartFinder filter)
]
