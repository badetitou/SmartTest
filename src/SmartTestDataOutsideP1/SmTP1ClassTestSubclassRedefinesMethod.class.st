"
Data for SmartTest tests on the testForClass:.

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

We will use this that to assert that SmartTest behaves correctly when dealing with inherited methods ans class.

This class inherits one test from its superior class and redefines it.
"
Class {
	#name : #SmTP1ClassTestSubclassRedefinesMethod,
	#superclass : #SmTP1ClassTestAbstractTestCase,
	#category : 'SmartTestDataOutsideP1-ModificationOnClass-Tests'
}

{ #category : #tests }
SmTP1ClassTestSubclassRedefinesMethod >> testModificationOnClassAbstractTestCase [
^super testModificationOnClassAbstractTestCase.
]
