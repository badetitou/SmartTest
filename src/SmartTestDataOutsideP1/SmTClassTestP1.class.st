"
Data for SmartTest tests on the filters (default, defaultClass, restricted package).

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are controlled and consequently the tests are independent the one from the others.

In the tests, it is always the methods whose name contains 'method1' that are modified. If the name contains first level, the methods are directly called by a test. If the name contains SecondLevel, they are called by an another method (whose name contains 'method2').

If the name of the test contains 'method2', the test use the method method2, if the test contains 'method1', the test directly uses the modified method.

"
Class {
	#name : #SmTClassTestP1,
	#superclass : #TestCase,
	#category : 'SmartTestDataOutsideP1-ModificationOnMethod-Tests'
}

{ #category : #testMethod1 }
SmTClassTestP1 >> testExtensionMethod1FirstLevelSendersInside [
SmTExtensionP2Test >> #extensionMethod1FirstLevelSendersInside
]

{ #category : #testMethod1 }
SmTClassTestP1 >> testMethod1FirstLevelSendersInsidePackage [
"Data for tests: this method calls directly a method from the same package."
"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P1') asClass new method1FirstLevelSendersInsidePackage.
]

{ #category : #testMethod2 }
SmTClassTestP1 >> testMethod2SecondLevelSendersInsidePackageWithTestInside [
"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P1') asClass new method2SecondLevelSendersInsidePackageWithTestInside.
]

{ #category : #testMethod2 }
SmTClassTestP1 >> testMethod2SecondLevelSendersOutsidePackageWithTestInside [
"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P2') asClass new method2SecondLevelSendersOutsidePackageWithTestInside.
]

{ #category : #testMethod2 }
SmTClassTestP1 >> testMethod2SecondLevelSendersOutsideTestInsideWithRefInClass [
"Data for tests: method directly called by a test method not from the same package"
	^('SmTClassP2SecondLevelSendersOutsideTestInsideWithRefIn','Class') asClass new method2SecondLevelSendersOutsideTestInsideWithRefInClass
" the behaviour of this method is not relevant."
]

{ #category : #testMethod2 }
SmTClassTestP1 >> testMethod2SecondLevelSendersOutsideTestInsideWithRefInMethod [
"Data for tests: method directly called by a test method not from the same package"
	^('SmTClassP2SecondLevelSendersOutsideTestInsideWithRefIn','Method') asClass new method2SecondLevelSendersOutsideTestInsideWithRefInMethod
" the behaviour of this method is not relevant."
]

{ #category : #testMethod2 }
SmTClassTestP1 >> testMethod2SecondLevelSendersOutsideTestInsideWithRefInPackage [
"Data for tests: method directly called by a test method not from the same package"
	^('SmTClassP2SecondLevelSendersOutsideTestInsideWithRefInPackage') asClass new method2SecondLevelSendersOutsideTestInsideWithRefInPackage
" the behaviour of this method is not relevant."
]
