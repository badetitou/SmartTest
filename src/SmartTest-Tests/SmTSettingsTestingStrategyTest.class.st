Class {
	#name : #SmTSettingsTestingStrategyTest,
	#superclass : #SmTSettingsTest,
	#category : 'SmartTest-Tests-Settings'
}

{ #category : #testing }
SmTSettingsTestingStrategyTest class >> isAbstract [
	^ self = SmTSettingsTestingStrategyTest 
]

{ #category : #running }
SmTSettingsTestingStrategyTest >> getTestingStrategy [
	 self subclassResponsibility 
]

{ #category : #tests }
SmTSettingsTestingStrategyTest >> testChangeTestingStrategyStrategy [
	"Test changement of the runner in the setting (throught SmTRules methods)"

	SmartFinder strategy: self getTestingStrategy.
	self assert: (SmartFinder settingInstance testingStrategy isKindOf: self getTestingStrategy).
	self assert: SmartFinder settingInstance testingStrategy runner equals: SmartFinder runner.
	self
		assert: SmartFinder settingInstance testingStrategy finder
		equals: SmartFinder settingInstance smtFinder
]
