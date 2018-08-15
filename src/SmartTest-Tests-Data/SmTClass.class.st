"
A class and some methods to test SmartTest.
The companion class SmTClassTest contains tests that invoke these methods

The idea is that asking for the tests that run for example #method1, we should get SmTClassTest>>testMethod1

"
Class {
	#name : #SmTClass,
	#superclass : #Object,
	#instVars : [
		'instVar1',
		'instVar2'
	],
	#category : 'SmartTest-Tests-Data'
}

{ #category : #'test data' }
SmTClass >> method1 [
	"this is data for SmTFinderAbstractTest tests"
	^ instVar1 
	
]

{ #category : #'test data' }
SmTClass >> method2 [
	"this is data for SmTFinderAbstractTest tests"
	self method3: self method1
]

{ #category : #'test data' }
SmTClass >> method3: anObject [
	"this is data for SmTFinderAbstractTest tests"
	instVar2 := anObject.
	self method4
]

{ #category : #'test data' }
SmTClass >> method4 [
	"this is data for SmTFinderAbstractTest tests"
	^ instVar2
]
