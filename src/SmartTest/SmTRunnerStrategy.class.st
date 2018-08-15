"
I'm a tool which help the plugin to run tests and return the result of them
"
Class {
	#name : #SmTRunnerStrategy,
	#superclass : #Object,
	#category : 'SmartTest-Runner'
}

{ #category : #accessing }
SmTRunnerStrategy class >> colorForTestResultOf: aTestResult [
	aTestResult hasErrors 
		ifTrue: [ ^ Color red ].
	aTestResult hasFailures 
		ifTrue: [ ^ Color yellow].
	aTestResult hasPassed
		ifTrue: [ ^ Color green ].
	^ Color gray
]

{ #category : #accessing }
SmTRunnerStrategy class >> iconForTestFromTestCaseHistory: aTestCase [
	(aTestCase class methodRaisedError: aTestCase selector)
		ifTrue: [ ^ #testRedIcon ].
	(aTestCase class methodFailed: aTestCase selector)
		ifTrue: [ ^ #testYellowIcon ].
	(aTestCase class methodPassed: aTestCase selector)
		ifTrue: [ ^ #testGreenIcon ].
	^ #testNotRunIcon
]

{ #category : #accessing }
SmTRunnerStrategy class >> iconForTestFromTestsCasesHistory: aCollectionOfTestCase [
	| iconType tempColor |
	iconType := #testNotRunIcon.
	aCollectionOfTestCase
		do: [ :aTestCase | 
			tempColor := self iconForTestFromTestCaseHistory: aTestCase.
			(tempColor = #testNotRunIcon)
				ifTrue: [ ^ #testNotRunIcon ].
			(tempColor = #testRedIcon)
				ifTrue: [ iconType := #testRedIcon ].
			(iconType = #testRedIcon)
				ifFalse: [ (tempColor = #testYellowIcon)
						ifTrue: [ iconType := #testYellowIcon ] ifFalse: [ iconType := tempColor  ] ] ].
				^ iconType 
]

{ #category : #accessing }
SmTRunnerStrategy class >> iconForTestResultOf: aTestResult [
	aTestResult hasErrors 
		ifTrue: [ ^ self iconNamed: #testRedIcon ].
	aTestResult hasFailures 
		ifTrue: [ ^ self iconNamed: #testYellowIcon ].
	aTestResult hasPassed
		ifTrue: [ ^ self iconNamed: #testGreenIcon ].
	^ self iconNamed: #testNotRunIcon.
]

{ #category : #action }
SmTRunnerStrategy class >> notifyTitle: title contents: aTestResult [

	 | contents |
	contents := aTestResult tests size > 3
		ifTrue: [ String streamContents: [ :aStream | 
				aStream 
					<< aTestResult tests size
					<< ' tests in: '.
				(aTestResult tests collect: #class as: Set) 
					do: [ :eachClass | aStream << eachClass name ]
					separatedBy: [ aStream << ', ' ] ] ]
		ifFalse: [ aTestResult  ].

	 GrowlMorph 
		openWithLabel: title
		contents: contents
		backgroundColor: (self colorForTestResultOf: aTestResult )
		labelColor: Color black
]

{ #category : #action }
SmTRunnerStrategy class >> runCase: aTestMethod notifyIcon: anIcon [
	| aTestResult |

	aTestResult := TestResult new.
	[ aTestResult runCaseForDebug: aTestMethod ]
		ensure: [ anIcon labelGraphic: (self iconForTestResultOf: aTestResult) ].
	anIcon labelGraphic: (self iconForTestResultOf: aTestResult).
	aTestResult updateResultsInHistory.
	self notifyTitle: 'SmartTest Execution' contents: aTestResult.
	^aTestResult.
]

{ #category : #action }
SmTRunnerStrategy class >> runCases: aTestCollection [
	| aTestResult |
	aTestResult := TestResult new.
	aTestCollection do: [ :aTest |aTestResult runCase: aTest ].
	aTestResult updateResultsInHistory.
	self notifyTitle: 'SmartTest Execution' contents: aTestResult.
	^aTestResult
]

{ #category : #action }
SmTRunnerStrategy class >> runCases: aTestCollection notifyIcon: anIcon [
	| aTestResult |
	aTestResult := self runCases: aTestCollection.
	anIcon labelGraphic: (self iconForTestResultOf: aTestResult ) .
	^aTestResult
]
