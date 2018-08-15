Class {
	#name : #SmTMethodTestedOnModificationRule,
	#superclass : #SmTMethodTestedRule,
	#instVars : [
		'bag'
	],
	#classInstVars : [
		'bag'
	],
	#category : 'SmartTest-Rules'
}

{ #category : #protocol }
SmTMethodTestedOnModificationRule class >> addToElementBag: anElement [
	self bag add: anElement
]

{ #category : #protocol }
SmTMethodTestedOnModificationRule class >> bag [
	^ bag ifNil: [ bag := Bag new ]
]

{ #category : #protocol }
SmTMethodTestedOnModificationRule class >> disable [
	super disable.
	SystemAnnouncer uniqueInstance unsubscribe: self
]

{ #category : #protocol }
SmTMethodTestedOnModificationRule class >> enable [
	super enable.
	SystemAnnouncer uniqueInstance unsubscribe: self.
	{(MethodModified -> #methodModified:).
	(MethodAdded -> #methodAdded:)}
		do: [ :pair | SystemAnnouncer uniqueInstance weak when: pair key send: pair value to: self ]
]

{ #category : #protocol }
SmTMethodTestedOnModificationRule class >> getElementFromBag: anElement [
	"return nil if element absent. The object else"

	self bag remove: anElement ifAbsent: [ ^ nil ].
	^ anElement
]

{ #category : #protocol }
SmTMethodTestedOnModificationRule class >> methodAdded: anAnnouncement [
	self addToElementBag: anAnnouncement methodAdded
]

{ #category : #protocol }
SmTMethodTestedOnModificationRule class >> methodModified: anAnnouncement [
	self addToElementBag: anAnnouncement newMethod
]

{ #category : #accessing }
SmTMethodTestedOnModificationRule >> basicCheck: anEntity [
	^ (super basicCheck: anEntity)
		and: [ (anEntity isKindOf: CompiledMethod) and: [ self class isMethodActivated and: [ (self class getElementFromBag: anEntity) isNotNil ] ] ]
]

{ #category : #accessing }
SmTMethodTestedOnModificationRule >> name [
	"Answer a human readable name of the rule."
	 ^ 'SmartTest Method Tested On modification'
]
