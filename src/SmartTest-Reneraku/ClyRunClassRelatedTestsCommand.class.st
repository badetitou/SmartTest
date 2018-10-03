"
I represent the button that run the tests that SmartTest's found about a class
"
Class {
	#name : #ClyRunClassRelatedTestsCommand,
	#superclass : #ClyCritiqueCommand,
	#category : #'SmartTest-Reneraku'
}

{ #category : #execution }
ClyRunClassRelatedTestsCommand >> canBeExecutedInContext: aCriticContext [

	^ (self canBeExecutedInDropContext: aCriticContext) and: [ SmTRelativeTestsCritique subclasses includes: aCriticContext class ]
]

{ #category : #'table decoration' }
ClyRunClassRelatedTestsCommand >> decorateTableCell: anItemCellMorph using: aCommandActivator [

	| button |
	(self canBeExecutedInContext: critique) ifFalse: [ ^ self ].
	button := SmTIconFabric createIconForMethods: critique tests.
		
	self decorateTableCell: anItemCellMorph with: button
]

{ #category : #'table decoration' }
ClyRunClassRelatedTestsCommand >> description [
	^'Run tests'
]

{ #category : #execution }
ClyRunClassRelatedTestsCommand >> execute [
]
