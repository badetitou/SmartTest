"
The windows where we can select test
"
Class {
	#name : #SmTAutoTestsWindows,
	#superclass : #ComposableModel,
	#instVars : [
		'testList',
		'button',
		'icons'
	],
	#category : #'SmartTest-Reneraku'
}

{ #category : #specs }
SmTAutoTestsWindows class >> defaultSpec [
	^ SpecLayout composed
		newRow: [ :row | row  add: #testList] top: 0 bottom: 0.2 ;
		newRow: [ :row | row  add: #button]  top: 0.8 bottom: 0;
		yourself
]

{ #category : #accessing }
SmTAutoTestsWindows >> button [
	^button
	
]

{ #category : #accessing }
SmTAutoTestsWindows >> extent [
	^ 400 @ 200
]

{ #category : #accessing }
SmTAutoTestsWindows >> icons [ 
	^icons ifNil: [ icons := OrderedCollection new ]
	
]

{ #category : #initialization }
SmTAutoTestsWindows >> initializePresenter [
	"Currently useless"

	button
		action:
			[ testList listItems withIndexDo: [ :el :id | (self icons at: id) doButtonAction ] ]
]

{ #category : #initialization }
SmTAutoTestsWindows >> initializeWidgets [
	testList := IconListModel new.
	button := self newButton.
	button label: 'Run all test'.
	self focusOrder add: testList.
	

]

{ #category : #accessing }
SmTAutoTestsWindows >> setList: aTestList [
	^ testList
		items: aTestList;
		icons: [ :testMethod | 
			| ib |
			ib := SmTIconFabric createIconForMethod: testMethod.
			self icons add: ib ]
]

{ #category : #accessing }
SmTAutoTestsWindows >> testList [
	^testList
	
]

{ #category : #accessing }
SmTAutoTestsWindows >> title [
	^ 'AutoTest Selection'.
]
