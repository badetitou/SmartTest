"
The critique that explains you need to write test for a method
"
Class {
	#name : #SmTMethodNeedTestsCritique,
	#superclass : #SmTNeedTestsCritique,
	#category : 'SmartTest-Critiques'
}

{ #category : #accessing }
SmTMethodNeedTestsCritique >> change [
]

{ #category : #accessing }
SmTMethodNeedTestsCritique >> description [
	^'You should always test your methods to ensure the fiability of your code'
]

{ #category : #accessing }
SmTMethodNeedTestsCritique >> execute [
	SmTTestGenerator new generateTestMethodFor: self sourceAnchor entity
]

{ #category : #accessing }
SmTMethodNeedTestsCritique >> nameToDisplay [
	^ 'Add a Test for ', self sourceAnchor entity name 
]

{ #category : #accessing }
SmTMethodNeedTestsCritique >> oldVersionTextToDisplay [
	^''
]

{ #category : #testing }
SmTMethodNeedTestsCritique >> providesChange [
	^true
]

{ #category : #accessing }
SmTMethodNeedTestsCritique >> textToDisplay [
	^''
]

{ #category : #accessing }
SmTMethodNeedTestsCritique >> title [
	^ 'You should write tests for your method'
]

{ #category : #accessing }
SmTMethodNeedTestsCritique >> whatToDisplayIn: aBrowser [
	^ { self }
]
