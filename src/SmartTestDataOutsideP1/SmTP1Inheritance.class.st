"
Data for SmartTest tests on the filters.

With this class, we try to assert that SmartTest work correctly with Inherited methods and tests.

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

In the tests, it is always the methods whose name contains 'method1' that are modified. If the name contains first level, the methods are directly called by a test. If the name contains SecondLevel, they are called by an another method (whose name contains 'method2').


"
Class {
	#name : #SmTP1Inheritance,
	#superclass : #Object,
	#category : 'SmartTestDataOutsideP1-ModificationOnMethod-Inheritance'
}

{ #category : #method1 }
SmTP1Inheritance >> method1Inheritance [
"The behaviour of this method is irrelevant."
]
