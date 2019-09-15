"
The critique that explains you need to run test for this class
"
Class {
	#name : #SmTClassRelativeTestsCritique,
	#superclass : #SmTRelativeTestsCritique,
	#category : #'SmartTest-Critiques'
}

{ #category : #'instance creation' }
SmTClassRelativeTestsCritique class >> for: anEntity by: aRule tests: aTestList [
	^ self basicNew
		initializeRule: aRule target: anEntity testsList: aTestList;
		yourself
]

{ #category : #accessing }
SmTClassRelativeTestsCritique >> description [
	^'You should always run tests your classes to ensure the fiability of your code'
]
