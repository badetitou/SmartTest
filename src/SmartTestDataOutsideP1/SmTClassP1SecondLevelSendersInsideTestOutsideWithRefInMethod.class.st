"
Data for SmartTest tests on the DefaultClassPackage filter.

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

In the tests, it is always the methods whose name contains 'method1' that are modified. If the name contains first level, the methods are directly called by a test. If the name contains SecondLevel, they are called by an another method (whose name contains 'method2').

In this class, there is the modified method and its first level sender (which contains 'method2' in it's name). In another package, there is the second level sender of the modified method (which contains 'testmethod2' in it's name).

This class is referenced in the package SmartTestDataOutsideP2inside the same method as testMethod2.
"
Class {
	#name : #SmTClassP1SecondLevelSendersInsideTestOutsideWithRefInMethod,
	#superclass : #Object,
	#category : 'SmartTestDataOutsideP1-ModificationOnMethod-SenderInTestOutWithRef'
}

{ #category : #method1 }
SmTClassP1SecondLevelSendersInsideTestOutsideWithRefInMethod >> method1SecondLevelSendersInsideTestOutsideWithRefInMethod [
"Data for tests: method directly called by a test method not from the same package"
	
" the behaviour of this method is not relevant."
]

{ #category : #method2 }
SmTClassP1SecondLevelSendersInsideTestOutsideWithRefInMethod >> method2SecondLevelSendersInsideTestOutsideWithRefInMethod [
"Data for tests: method directly called by a test method not from the same package"
	^ self method1SecondLevelSendersInsideTestOutsideWithRefInMethod
" the behaviour of this method is not relevant."
]
