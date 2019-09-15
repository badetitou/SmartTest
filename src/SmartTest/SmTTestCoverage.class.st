"
I'm a tool that help configure the finder for the TestCoverage strategy.
"
Class {
	#name : #SmTTestCoverage,
	#superclass : #HDTestCoverage,
	#instVars : [
		'finder'
	],
	#category : #'SmartTest-Tools'
}

{ #category : #accessing }
SmTTestCoverage >> finder [
	^ finder
]

{ #category : #accessing }
SmTTestCoverage >> finder: aSmTFinder [
	finder := aSmTFinder
]

{ #category : #accessing }
SmTTestCoverage >> mark [
	hasRun
		ifFalse: [ hasRun := true.
			 self finder
				addToCurrentExecutionMethodReference: reference ]
]

{ #category : #accessing }
SmTTestCoverage >> run: aSelector with: anArray in: aReceiver [
	self mark.
	^ aReceiver withArgs: anArray executeMethod: method
]
