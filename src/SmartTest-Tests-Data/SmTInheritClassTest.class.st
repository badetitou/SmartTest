"
A test to test if SmartTest works with inherited tests.
This is the concrete class that executes the tests of its superclass
"
Class {
	#name : #SmTInheritClassTest,
	#superclass : #SmTSuperClassTest,
	#category : 'SmartTest-Tests-Data'
}

{ #category : #initialization }
SmTInheritClassTest >> setUp [
	smTtestClass := SmTClass new
]
