"
A class and some methods to test SmartTest.
The companion class SmTClassTest contains tests that invoke these methods

The idea is that asking for the tests that run for example #method1, we should get SmTClassTest>>testMethod1

"
Class {
	#name : #SmTClass2,
	#superclass : #Object,
	#instVars : [
		'instVar1',
		'instVar2'
	],
	#category : 'SmartTest-Tests-Data'
}

{ #category : #initialization }
SmTClass2 >> initialize [
	instVar1 := nil.
]
