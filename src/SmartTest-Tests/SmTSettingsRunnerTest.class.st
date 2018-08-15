Class {
	#name : #SmTSettingsRunnerTest,
	#superclass : #SmTSettingsTest,
	#category : 'SmartTest-Tests-Settings'
}

{ #category : #testing }
SmTSettingsRunnerTest class >> isAbstract [
	^ self = SmTSettingsRunnerTest
]

{ #category : #running }
SmTSettingsRunnerTest >> runnerStrategy [
	self subclassResponsibility
]

{ #category : #tests }
SmTSettingsRunnerTest >> testChangeRunnerStrategy [
	"Test changement of the runner in the setting (throught SmTRules methods)"

	SmTRules runner: self runnerStrategy.
	self assert: SmTRules testFinder testRunner equals: self runnerStrategy.
	self assert: SmTRules testFinder testingStrategy runner equals: self runnerStrategy.
]
