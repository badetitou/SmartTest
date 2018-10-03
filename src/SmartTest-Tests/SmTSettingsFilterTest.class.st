Class {
	#name : #SmTSettingsFilterTest,
	#superclass : #SmTSettingsTest,
	#category : 'SmartTest-Tests-Settings'
}

{ #category : #testing }
SmTSettingsFilterTest class >> isAbstract [
	^ self = SmTSettingsFilterTest 
]

{ #category : #running }
SmTSettingsFilterTest >> filterStrategy [
	self subclassResponsibility 
]

{ #category : #tests }
SmTSettingsFilterTest >> testChangeFilterStrategy [
	"Test changement of the runner in the setting (throught SmTRules methods)"

	SmartFinder filter: self filterStrategy.
	self assert: (SmartFinder settingInstance filter isKindOf: self filterStrategy).
	self assert: (SmartFinder settingInstance smtFinder filter isKindOf: self filterStrategy)
]
