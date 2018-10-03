Class {
	#name : #SmTSettingsRunnerTest,
	#superclass : #SmTSettingsTest,
	#category : #'SmartTest-Tests-Settings'
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

	SmartFinder runner: self runnerStrategy.
	self assert: SmartFinder settingInstance testRunner equals: self runnerStrategy.
	self assert: SmartFinder settingInstance testingStrategy runner equals: self runnerStrategy
]
