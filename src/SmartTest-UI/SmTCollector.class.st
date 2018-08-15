"
This collector exists to describe all the ways the tests can be collected.
"
Class {
	#name : #SmTCollector,
	#superclass : #Object,
	#category : 'SmartTest-UI-Collector'
}

{ #category : #accessing }
SmTCollector >> addTestMethod: aTestMethod [  
	self collector add: aTestMethod 
]

{ #category : #accessing }
SmTCollector >> addTestMethods: aCollectionOfTestsMethod [
	self collector addAll: aCollectionOfTestsMethod 
]

{ #category : #accessing }
SmTCollector >> collector [
	self subclassResponsibility 
]

{ #category : #accessing }
SmTCollector >> flush [
	self collector removeAll
]
