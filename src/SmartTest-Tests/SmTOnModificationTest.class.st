"
A CORAOnModificationTest is a test class for testing the behavior of CORAOnModification
"
Class {
	#name : #SmTOnModificationTest,
	#superclass : #TestCase,
	#instVars : [
		'onModif'
	],
	#category : 'SmartTest-Tests-OnModification'
}

{ #category : #'tests-adding' }
SmTOnModificationTest >> setUp [
	"prepare strategy"
	onModif := SmTTestingStrategyEachModification new.
]

{ #category : #'tests-adding' }
SmTOnModificationTest >> tearDown [
	"prepare strategy"
	onModif disable 
]

{ #category : #'tests-adding' }
SmTOnModificationTest >> testAdd [
	| el |
	onModif := SmTTestingStrategyEachModification new.
	self assert: onModif bag isEmpty.
	el := SmTRunnerTest >> #noop.
	onModif addToElementBag: el.
	self assert: onModif bag size equals: 1.
	self assert: (onModif bag includes: el).
	onModif disable
]

{ #category : #'tests-adding' }
SmTOnModificationTest >> testGet [
	| el |
	onModif := SmTTestingStrategyEachModification new.
	el := SmTRunnerTest >> #noop.
	onModif addToElementBag: el.
	self
		assert: (onModif getElementFromBag: SmTRunnerTest >> #testIconForTestResultGreen)
		equals: nil.
	self assert: onModif bag size equals: 1.
	self
		assert: (onModif getElementFromBag: SmTRunnerTest >> #testIconForTestResultGreen)
		equals: nil.
	self assert: (onModif getElementFromBag: el) equals: el.
	self assert: onModif bag size equals: 0.
	self assert: (onModif getElementFromBag: el) equals: nil
]
