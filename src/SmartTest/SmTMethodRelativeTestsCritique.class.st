"
The critique that explains you should run test for this method
"
Class {
	#name : #SmTMethodRelativeTestsCritique,
	#superclass : #SmTRelativeTestsCritique,
	#instVars : [
		'entity'
	],
	#category : #'SmartTest-Critiques'
}

{ #category : #'instance creation' }
SmTMethodRelativeTestsCritique class >> for: anEntity by: aRule tests: aTestList [
	^ self basicNew
		initializeRule: aRule target: anEntity testsList: aTestList;
		yourself
]

{ #category : #accessing }
SmTMethodRelativeTestsCritique >> description [
	^'You should always test your methods to ensure the fiability of your code'
]
