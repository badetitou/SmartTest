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

	SmTRules filter: self filterStrategy.
	self assert: (SmTRules testFinder filter isKindOf: self filterStrategy).
	self assert: (SmTRules testFinder smtFinder filter isKindOf: self filterStrategy)
]
