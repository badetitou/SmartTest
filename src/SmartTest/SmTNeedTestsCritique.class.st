"
I represent a critique when there are no tests for an entity
"
Class {
	#name : #SmTNeedTestsCritique,
	#superclass : #ReAbstractCritique,
	#category : 'SmartTest-Critiques'
}

{ #category : #accessing }
SmTNeedTestsCritique >> description [
	self subclassResponsibility 
]

{ #category : #accessing }
SmTNeedTestsCritique >> icon [
	^#warning asIcon
]

{ #category : #testing }
SmTNeedTestsCritique >> providesChange [
	^false
]

{ #category : #accessing }
SmTNeedTestsCritique >> title [
	self subclassResponsibility 
]
