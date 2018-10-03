"
The collector used by the Listener to save all the relative test method
"
Class {
	#name : #SmTBigButtonCollector,
	#superclass : #Object,
	#instVars : [
		'morph',
		'collector'
	],
	#classInstVars : [
		'activated',
		'bigButton'
	],
	#category : #'SmartTest-BigButton'
}

{ #category : #accessing }
SmTBigButtonCollector class >> activated [
	^ activated ifNil: [ activated := false ]
]

{ #category : #accessing }
SmTBigButtonCollector class >> activated: aSelector [
	activated := aSelector.
	bigButton activated: aSelector
]

{ #category : #accessing }
SmTBigButtonCollector class >> bigButton [
	^ bigButton
]

{ #category : #accessing }
SmTBigButtonCollector class >> initialize [
	bigButton := self new
]

{ #category : #accessing }
SmTBigButtonCollector class >> reset [
	self bigButton collector: nil
]

{ #category : #accessing }
SmTBigButtonCollector class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #activated)
		parent: 'SmartTest';
		target: self;
		order: 0.01;
		label: 'SmartTest Collect Button';
		description: 'Toogle to activate/disable the Big Button'.
	(aBuilder group: #reset)
		label: 'Big Button Reset Cache';
		target: self;
		parent: #SmartTest;
		order: 8;
		dialog: [ SimpleButtonMorph new
				target: self;
				label: 'Reset Collect Button Cache';
				actionSelector: #reset;
				themeChanged;
				yourself ];
		description:
			'Reset the cache of SmartTest
		SmTTestFinderStrategy methodToTest'
]

{ #category : #'initialize - release' }
SmTBigButtonCollector class >> unload [
	self activated: false
]

{ #category : #accessing }
SmTBigButtonCollector >> activated: aSelector [
	aSelector ifTrue: [ self enable ] ifFalse: [ self disable ].
]

{ #category : #accessing }
SmTBigButtonCollector >> addTestMethod: aTestMethod [  
	self collector add: aTestMethod 
]

{ #category : #accessing }
SmTBigButtonCollector >> addTestMethods: aCollectionOfTestsMethod [
	self collector addAll: aCollectionOfTestsMethod 
]

{ #category : #accessing }
SmTBigButtonCollector >> changeColorFromTestResult: aTestResult [
	morph buttonMorph color: Color gray.
	aTestResult passedCount > 0
		ifTrue: [ morph buttonMorph color: Color green ].
	aTestResult hasFailures
		ifTrue: [ morph buttonMorph color: Color yellow ].
	aTestResult hasErrors
		ifTrue: [ morph buttonMorph color: Color red ].
]

{ #category : #accessing }
SmTBigButtonCollector >> collector [
	^ collector
]

{ #category : #accessing }
SmTBigButtonCollector >> collector: anObject [

	collector := anObject
]

{ #category : #accessing }
SmTBigButtonCollector >> disable [
	"Do not receiver any system change notification anymore"
	morph window isClosed ifFalse: [ morph window close] .
	SystemAnnouncer uniqueInstance unsubscribe: self
]

{ #category : #accessing }
SmTBigButtonCollector >> enable [
	morph openWithSpec.
	SystemAnnouncer uniqueInstance unsubscribe: self.
	{(MethodModified -> #methodModified:)} do: [ :pair | SystemAnnouncer uniqueInstance weak when: pair key send: pair value to: self ].

]

{ #category : #accessing }
SmTBigButtonCollector >> flush [
	self collector removeAll
]

{ #category : #accessing }
SmTBigButtonCollector >> initialize [
	collector := Set new.
	morph := SmTButtonResultWindow new.
	morph controler: self.
]

{ #category : #accessing }
SmTBigButtonCollector >> methodModified: anAnnouncement [
	
	[| listOfTest |
	listOfTest := SmartFinder settingInstance researchTestsForMethod: anAnnouncement newMethod. 
	self collector
		addAll: listOfTest.
	self updateUIAfterAddingMethod: listOfTest.] forkAt: 20 named: 'BigButton'
]

{ #category : #accessing }
SmTBigButtonCollector >> notify [
	| aTestResult |
	aTestResult := SmartFinder settingInstance runner
		runCases:
			(self collector
				collect: [ :aMethodReference | aMethodReference methodClass selector: aMethodReference selector ]).
	self
		collector:
			(self collector
				reject: [ :a | ((TestResult historyAt: a methodClass) at: #passed) includes: a selector ]).
	self updateNumberOfTheProgressCircle.
	self changeColorFromTestResult: aTestResult.
	morph fillFailedTestListFromTestResult: aTestResult
]

{ #category : #accessing }
SmTBigButtonCollector >> updateList: listOfTest [
	morph addToListTestsMethods: listOfTest
]

{ #category : #accessing }
SmTBigButtonCollector >> updateNumberOfTheProgressCircle [
	morph buttonText acceptValue: self collector size asTwoCharacterString.
	morph buttonMorph color: Color gray.
]

{ #category : #accessing }
SmTBigButtonCollector >> updateUIAfterAddingMethod: listOfTest [
	self updateNumberOfTheProgressCircle.
	self updateList: listOfTest
]
