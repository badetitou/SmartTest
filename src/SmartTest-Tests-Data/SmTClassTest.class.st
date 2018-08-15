"
Companion class of SmTClass totest SmartTest.

Each test here exercise a method of SmTClass

"
Class {
	#name : #SmTClassTest,
	#superclass : #TestCase,
	#category : 'SmartTest-Tests-Data'
}

{ #category : #'test data' }
SmTClassTest >> setUp [
	"this is data for SmTFinderAbstractTest tests"
]

{ #category : #'test data' }
SmTClassTest >> tearDown [
	"this is data for SmTFinderAbstractTest tests"
]

{ #category : #'test data' }
SmTClassTest >> testMethod1 [
	"this is data for SmTFinderAbstractTest tests"
	^ SmTClass new method1 
	
]

{ #category : #'test data' }
SmTClassTest >> testMethod2 [
	"this is data for SmTFinderAbstractTest tests"
	^ SmTClass new method2 
	
]

{ #category : #'test data' }
SmTClassTest >> testMethod3 [
	"this is data for SmTFinderAbstractTest tests"
	^ SmTClass new method3: 3. 
	
]

{ #category : #'test data' }
SmTClassTest >> testMethod4 [
	"this is data for SmTFinderAbstractTest tests"
	^ SmTClass new method4 
	
]

{ #category : #'test data' }
SmTClassTest >> testMethod5 [
	^ SmTClass2 new. 
]
