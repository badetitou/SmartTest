"
I represent the button that open details of tests you should run from SmartTest (for a class)
"
Class {
	#name : #ClyOpenClassRelatedTestsCommand,
	#superclass : #ClyCritiqueCommand,
	#category : #'SmartTest-Reneraku'
}

{ #category : #testing }
ClyOpenClassRelatedTestsCommand class >> canBeExecutedInContext: aCriticContext [
	^ SmTRelativeTestsCritique subclasses includes: aCriticContext selectedCritique class
]

{ #category : #execution }
ClyOpenClassRelatedTestsCommand >> decorateTableCell: anItemCellMorph using: aCommandActivator [
	anItemCellMorph
		addExtraTool:
			(IconicButton new
				labelGraphic: (Smalltalk iconNamed: #smallWindow);
				color: Color transparent;
				borderColor: Color transparent;
				target: self;
				actionSelector: #execute)
]

{ #category : #'table decoration' }
ClyOpenClassRelatedTestsCommand >> description [
	^'Open Tests Selection'
]

{ #category : #execution }
ClyOpenClassRelatedTestsCommand >> execute [
	critique openTestsWindowWith: critique tests
]
