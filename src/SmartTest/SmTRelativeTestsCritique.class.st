"
I represent a critique when there are tests to run for an entity
"
Class {
	#name : #SmTRelativeTestsCritique,
	#superclass : #ReAbstractCritique,
	#instVars : [
		'tests',
		'testButton'
	],
	#category : #'SmartTest-Critiques'
}

{ #category : #'instance creation' }
SmTRelativeTestsCritique class >> for: anEntity by: aRule tests: aTestList [
	^ self basicNew
		initializeRule: aRule target: anEntity testsList: aTestList;
		yourself
]

{ #category : #actions }
SmTRelativeTestsCritique >> actions [
	^ super actions
		copyWith:
			(RePropertyAction new
				icon: #smallWindow asIcon;
				description: 'Open Tests Selection';
				action:
						[ :crit :package | self openTestsWindowWith: tests ];
				yourself)
]

{ #category : #accessing }
SmTRelativeTestsCritique >> description [
	self subclassResponsibility 
]

{ #category : #accessing }
SmTRelativeTestsCritique >> icon [

	^#smallInfo asIcon
]

{ #category : #accessing }
SmTRelativeTestsCritique >> iconicButtons [
	self testButton: (SmTIconFabric createIconForMethods: self tests).
	^ {self testButton}
]

{ #category : #initialization }
SmTRelativeTestsCritique >> initializeRule: aRule target: anEntity testsList: aTestList [
	self initializeRule: aRule target: anEntity.
	tests := aTestList
]

{ #category : #actions }
SmTRelativeTestsCritique >> openTestsWindowWith: aTestList [
	| ui |
	ui := SmTAutoTestsWindows new.
	ui setList: aTestList.
	ui openWithSpec.
]

{ #category : #testing }
SmTRelativeTestsCritique >> providesChange [
	^false
]

{ #category : #accessing }
SmTRelativeTestsCritique >> testButton [
	^ testButton
]

{ #category : #accessing }
SmTRelativeTestsCritique >> testButton: anObject [
	testButton := anObject 
]

{ #category : #accessing }
SmTRelativeTestsCritique >> tests [
	^ tests
]

{ #category : #accessing }
SmTRelativeTestsCritique >> tests: anObject [
	tests := anObject
]

{ #category : #accessing }
SmTRelativeTestsCritique >> title [
	^ 'You should run these tests'
]
