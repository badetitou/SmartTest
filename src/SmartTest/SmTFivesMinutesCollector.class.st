"
I collect all the tests and run it each 5 minutes
"
Class {
	#name : #SmTFivesMinutesCollector,
	#superclass : #Object,
	#instVars : [
		'process',
		'collector'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'SmartTest-Tools'
}

{ #category : #accessing }
SmTFivesMinutesCollector class >> addTestMethod: aTestMethod [
	self uniqueInstance addTestMethod: aTestMethod
]

{ #category : #accessing }
SmTFivesMinutesCollector class >> addTestMethods: aCollectionOfTestMethods [
	self uniqueInstance addTestMethods: aCollectionOfTestMethods
]

{ #category : #accessing }
SmTFivesMinutesCollector class >> start [
	self uniqueInstance start
]

{ #category : #accessing }
SmTFivesMinutesCollector class >> stop [
	self uniqueInstance stop
]

{ #category : #accessing }
SmTFivesMinutesCollector class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new]
]

{ #category : #accessing }
SmTFivesMinutesCollector >> addTestMethod: aTestMethod [  
	self collector add: aTestMethod 
]

{ #category : #accessing }
SmTFivesMinutesCollector >> addTestMethods: aCollectionOfTestsMethod [
	self collector addAll: aCollectionOfTestsMethod 
]

{ #category : #accessing }
SmTFivesMinutesCollector >> collector [
	^ collector
]

{ #category : #accessing }
SmTFivesMinutesCollector >> flush [
	self collector removeAll
]

{ #category : #accessing }
SmTFivesMinutesCollector >> initialize [
	collector := Set new
]

{ #category : #accessing }
SmTFivesMinutesCollector >> process [
	^ process
		ifNil: [ process := [ [ true ]
				whileTrue: [ (Delay forSeconds: 300) wait.
					self collector
						ifNotEmpty: [ | tempOrderedCollection |
							tempOrderedCollection := OrderedCollection new.
							tempOrderedCollection add: self collector .
							([ :aCollectionOfTest | 
							| tempResult |
							tempResult := SmTRules runner runCases: aCollectionOfTest.
							self showResult: tempResult ] newProcessWith: tempOrderedCollection) resume.
							self reset ] ] ] newProcess ]
]

{ #category : #action }
SmTFivesMinutesCollector >> reset [
	collector removeAll
]

{ #category : #'UI specific' }
SmTFivesMinutesCollector >> showResult: aTestResult [
	| ui |

	(aTestResult hasErrors or: aTestResult hasFailures)
		ifFalse: [ ^ self ].
	ui := SmTAutoTestsWindows new.
	ui setList: aTestResult tests.
	ui openWithSpec.

]

{ #category : #action }
SmTFivesMinutesCollector >> start [
	self process resume.
]

{ #category : #action }
SmTFivesMinutesCollector >> stop [
	self process suspend 
]
