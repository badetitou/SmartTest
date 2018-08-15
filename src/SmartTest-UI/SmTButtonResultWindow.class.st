"
I show all the results in a window.
"
Class {
	#name : #SmTButtonResultWindow,
	#superclass : #ComposablePresenter,
	#instVars : [
		'testList',
		'button',
		'icons',
		'controler',
		'buttonText'
	],
	#category : 'SmartTest-UI-Morph'
}

{ #category : #specs }
SmTButtonResultWindow class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :row | row add: #button ] left: 0 right: 0.6;
		newColumn: [ :row | row add: #testList ] left: 0.4 right: 1;
		yourself
]

{ #category : #accessing }
SmTButtonResultWindow >> addToListTestsMethods: newTestMethod [
	| list |
	list := testList listItems asOrderedCollection.
	list := (list collect: [ :a | (a class lookupSelector: a selector) methodReference  ]) asSet.
	list addAll: newTestMethod.
	self setList: ((list collect: [:methodReference | methodReference methodClass selector: methodReference selector]) asOrderedCollection sort: [ :a :b | a asString < b asString ] ) 
]

{ #category : #accessing }
SmTButtonResultWindow >> button [
	^ button
]

{ #category : #accessing }
SmTButtonResultWindow >> button: anObject [
	button := anObject
]

{ #category : #accessing }
SmTButtonResultWindow >> buttonMorph [
	^ button morph
]

{ #category : #accessing }
SmTButtonResultWindow >> buttonText [
	^ buttonText
]

{ #category : #accessing }
SmTButtonResultWindow >> buttonText: anObject [
	buttonText := anObject
]

{ #category : #accessing }
SmTButtonResultWindow >> controler [
	^controler
]

{ #category : #accessing }
SmTButtonResultWindow >> controler: anObject [
	 self button morph controler: anObject
]

{ #category : #accessing }
SmTButtonResultWindow >> extent [
	^ 600 @ 300
]

{ #category : #accessing }
SmTButtonResultWindow >> fillFailedTestListFromTestResult: aTestResult [
	
	| list list2 |
	list := testList listItems asOrderedCollection.
	list := list
		reject: [ :a | ((TestResult historyAt: a class) at: #passed) includes: a selector ].
	list addAll: aTestResult errors.
	list addAll: aTestResult failures.
	list := (list collect: [ :a | (a class lookupSelector: a selector) methodReference ])
		asSet.
	self
		setList:
			((list
				collect: [ :methodReference | methodReference methodClass selector: methodReference selector ])
				asOrderedCollection sort: [ :a :b | a asString < b asString ])
]

{ #category : #accessing }
SmTButtonResultWindow >> icons [
	^icons ifNil: [ icons := OrderedCollection new ]
	
]

{ #category : #accessing }
SmTButtonResultWindow >> icons: anObject [
	icons := anObject
]

{ #category : #accessing }
SmTButtonResultWindow >> initializeWidgets [
	testList := IconListModel new.
	button := (SmTProgressCircle new
		controler: self;
		percentage: 100;
		extent: 400@200;
		color: Color gray) asSpecAdapter.
	
	buttonText := ('00' asStringMorph
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 50) emphasis: 2;
		position: 60@60;
		color: Color white;
		yourself).
	
	self buttonMorph addMorphFront: buttonText.
		

	self focusOrder add: testList.
]

{ #category : #initialization }
SmTButtonResultWindow >> setList: aTestList [
	^ testList
		items: aTestList;
		icons: [ :testMethod | 
			| ib |
			ib := SmTIconFabric createIconForMethod: testMethod.
			self icons add: ib ]
]

{ #category : #accessing }
SmTButtonResultWindow >> testList [
	^ testList
]

{ #category : #accessing }
SmTButtonResultWindow >> testList: anObject [
	testList := anObject
]

{ #category : #accessing }
SmTButtonResultWindow >> title [
	^ 'Tests Results'.
]
