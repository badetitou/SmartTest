"
I collect tests, run tests and notify the big button of my work
"
Class {
	#name : #SmTEventRecipient,
	#superclass : #Object,
	#category : 'SmartTest-Event'
}

{ #category : #action }
SmTEventRecipient >> actionForEvent: anEvent fromMorph: aMorph [
	self runTestAndShowProgressIn: aMorph
]

{ #category : #action }
SmTEventRecipient >> runTestAndShowProgressIn: aMorph [
]
