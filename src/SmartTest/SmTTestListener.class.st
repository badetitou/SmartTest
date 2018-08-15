"
I'm listening all the tests event and add it to the RTS
"
Class {
	#name : #SmTTestListener,
	#superclass : #Object,
	#instVars : [
		'cacheClass',
		'smtDynamicFinder'
	],
	#classInstVars : [
		'uniqueInstance',
		'activated'
	],
	#category : 'SmartTest-Listener'
}

{ #category : #accessing }
SmTTestListener class >> activated [
	^ activated
		ifNil: [ activated := false.
			self uniqueInstance activated: false ]
]

{ #category : #accessing }
SmTTestListener class >> activated: aSelector [
	activated := aSelector.
	self uniqueInstance activated: aSelector
]

{ #category : #initialization }
SmTTestListener class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #activated)
		parent: #Beta;
		target: self;
		order: 0.04;
		label: 'AutoUpdate Cache';
		description:
			'When you execute a test, we''''are updating the cache for it execution
	(BETA)'
]

{ #category : #initialization }
SmTTestListener class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'announcement handling' }
SmTTestListener >> activated: aSelector [
	aSelector
		ifTrue: [ self disableListenerTestCase.
			self enableListenerTestCase ]
		ifFalse: [ self disableListenerTestCase ]
]

{ #category : #'announcement handling' }
SmTTestListener >> cacheStrategy [
	^ cacheClass
]

{ #category : #'announcement handling' }
SmTTestListener >> cacheStrategy: aCacheClass [
	cacheClass := aCacheClass 
]

{ #category : #protocol }
SmTTestListener >> disableListenerTestCase [
	SmTAnnouncer announcer unsubscribe: self.
		SmTAnnouncer announcer unsubscribe: self
]

{ #category : #protocol }
SmTTestListener >> enableListenerTestCase [
	SmTAnnouncer announcer weak when: TestCaseStarted send: #testCaseStarted: to: self.
	SmTAnnouncer announcer weak when: TestCaseEnded send: #testCaseEnded: to: self
]

{ #category : #'announcement handling' }
SmTTestListener >> smtDynamicFinder [
	^ smtDynamicFinder
]

{ #category : #'announcement handling' }
SmTTestListener >> smtDynamicFinder: aSmTTestFinderStrategy [
	smtDynamicFinder := aSmTTestFinderStrategy
]

{ #category : #protocol }
SmTTestListener >> testCaseEnded: aTestAnnouncement [
	self smtDynamicFinder analyseAndRemoveProxyFor: aTestAnnouncement testCase
]

{ #category : #protocol }
SmTTestListener >> testCaseStarted: aTestAnnouncement [
	self smtDynamicFinder installProxyFor: aTestAnnouncement testCase 
]
