"
Each time the developer does a modification, CORA run the test suite
"
Class {
	#name : #SmTTestingStrategyEachModification,
	#superclass : #SmTTestingStrategy,
	#instVars : [
		'bag'
	],
	#category : 'SmartTest-Testing'
}

{ #category : #'instance creation' }
SmTTestingStrategyEachModification >> addToElementBag: anElement [
	self bag add: anElement
]

{ #category : #'instance creation' }
SmTTestingStrategyEachModification >> bag [
	 ^ bag
]

{ #category : #protocol }
SmTTestingStrategyEachModification >> disable [
	super disable.
	
	SystemAnnouncer uniqueInstance unsubscribe: self
]

{ #category : #protocol }
SmTTestingStrategyEachModification >> enable [
	super enable.
	SystemAnnouncer uniqueInstance unsubscribe: self.
	{(MethodModified -> #methodModified:).
	(MethodAdded -> #methodAdded:)}
		do: [ :pair | SystemAnnouncer uniqueInstance weak when: pair key send: pair value to: self ]
]

{ #category : #'instance creation' }
SmTTestingStrategyEachModification >> findTestsForMethod: aCompiledMethod [
	| tests |
	tests := self getMethodsFor: aCompiledMethod.
	(self getElementFromBag: aCompiledMethod)
		ifNotNil: [ self runner runCases: tests ].
	^ tests
]

{ #category : #'instance creation' }
SmTTestingStrategyEachModification >> getElementFromBag: anElement [
	"return nil if element absent. The object else"

	self bag remove: anElement ifAbsent: [ ^ nil ].
	^ anElement
]

{ #category : #initialization }
SmTTestingStrategyEachModification >> initialize [
	bag := Bag new
]

{ #category : #'instance creation' }
SmTTestingStrategyEachModification >> methodAdded: anAnnouncement [
	self addToElementBag: anAnnouncement methodAdded
]

{ #category : #'instance creation' }
SmTTestingStrategyEachModification >> methodModified: anAnnouncement [
	self addToElementBag: anAnnouncement newMethod
]
