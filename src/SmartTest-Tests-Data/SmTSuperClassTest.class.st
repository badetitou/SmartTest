"
A test to test if SmartTest works with inherited tests.
This is an abstract class that is never really executed

"
Class {
	#name : #SmTSuperClassTest,
	#superclass : #TestCase,
	#instVars : [
		'smTtestClass'
	],
	#category : 'SmartTest-Tests-Data'
}

{ #category : #testing }
SmTSuperClassTest class >> isAbstract [

	^ self  == SmTSuperClassTest 
]

{ #category : #tests }
SmTSuperClassTest >> testMethod1 [
	^ smTtestClass method1
	
]
