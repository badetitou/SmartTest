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

	SmTRules strategy: self getTestingStrategy .
	self assert: (SmTRules testFinder testingStrategy isKindOf:  self getTestingStrategy ).
	self assert: SmTRules testFinder testingStrategy runner equals: SmTRules runner.
	self assert: SmTRules testFinder testingStrategy finder equals: SmTRules testFinder smtFinder
]
