"
Data for SmartTest tests on the filters.

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

In the tests, it is always the methods whose name contains 'method1' that are modified. If the name contains first level, the methods are directly called by a test. If the name contains SecondLevel, they are called by an another method (whose name contains 'method2').

This class is referenced by SmTP1ClassTestFirstLevelSendersInsideWithRefInMethod >> testMethod1FirstLevelSendersInsideWithRefInMethod .

"
Class {
	#name : #SmTClassP1FirstLevelSendersInsideWithRefInMethod,
	#superclass : #Object,
	#category : 'SmartTestDataOutsideP1-ModificationOnMethod-FirstLevelWithRef'
}

{ #category : #method1 }
SmTClassP1FirstLevelSendersInsideWithRefInMethod >> method1FirstLevelSendersInsideWithRefInMethod [
"Data for tests: method directly called by a test method not from the same package"
	
" the behaviour of this method is not relevant."
]
