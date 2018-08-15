"
Data for SmartTest tests on the filters (default, defaultClass, restricted package).

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are controlled and consequently the tests are independent the one from the others.

In the tests, it is always the methods whose name contains 'method1' that are modified. If the name contains first level, the methods are directly called by a test. If the name contains SecondLevel, they are called by an another method (whose name contains 'method2').

If the name of the test contains 'method2', the test use the method method2, if the test contains 'method1', the test directly uses the modified method.


The methods and tests in this package are not located in the same package as the modified method.
"
Class {
	#name : #SmTClassTestP2Test,
	#superclass : #TestCase,
	#category : 'SmartTestDataOutsideP2-ModificationOnMethod-Tests'
}

{ #category : #references }
SmTClassTestP2Test >> referenceToSmTClassP1FirstLevelSendersOutsideWithRefInClass [
^ SmTClassP1FirstLevelSendersOutsideWithRefInClass.
]

{ #category : #references }
SmTClassTestP2Test >> referenceToSmTClassP1SecondLevelSendersInsideTestOutsideWithRefInClass [
^SmTClassP1SecondLevelSendersInsideTestOutsideWithRefInClass new.
]

{ #category : #testMethod1 }
SmTClassTestP2Test >> testExtensionMethod1FirstLevelSendersOutside [
SmTExtensionP2Test >> #extensionMethod1FirstLevelSendersOutside.
]

{ #category : #testMethod1 }
SmTClassTestP2Test >> testMethod1FirstLevelSendersOutsidePackage [
	"Data for tests: this method calls directly method1, which is not located in the same package"
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P1') asClass new method1FirstLevelSendersOutsidePackage.
]

{ #category : #testMethod1 }
SmTClassTestP2Test >> testMethod1FirstLevelSendersOutsideWithRefInClass [
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
^ ('SmTClassP1','FirstLevelSendersOutsideWithRefInClass') asClass new method1FirstLevelSendersWithRefInClass.
]

{ #category : #testMethod1 }
SmTClassTestP2Test >> testMethod1FirstLevelSendersOutsideWithRefInMethod [
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
^SmTClassP1FirstLevelSendersOutsideWithRefInMethod new method1FirstLevelSendersWithRefInMethod.
]

{ #category : #testMethod1 }
SmTClassTestP2Test >> testMethod1FirstLevelSendersOutsideWithRefInPackage [	
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
^('SmTClassP1','FirstLevelSendersOutsideWithRefInPackage') asClass new method1FirstLevelSendersWithRefInPackage.
]

{ #category : #testMethod2 }
SmTClassTestP2Test >> testMethod2SecondLevelSenderInsideTestOutsideWithRefInClass [
^ ('SmTClass','P1SecondLevelSendersInsideTestOutsideWithRefInClass') asClass new method2SecondLevelSendersInsideTestOutsideWithRefInClass.
]

{ #category : #testMethod2 }
SmTClassTestP2Test >> testMethod2SecondLevelSenderInsideTestOutsideWithRefInMethod [
^ SmTClassP1SecondLevelSendersInsideTestOutsideWithRefInMethod new method2SecondLevelSendersInsideTestOutsideWithRefInMethod.
]

{ #category : #testMethod2 }
SmTClassTestP2Test >> testMethod2SecondLevelSenderInsideTestOutsideWithRefInPackage [
SmTClassP1SecondLevelSendersInsideTestOutsideWithRefInPackage new method2SecondLevelSendersInsideTestOutsideWithRefInPackage.
]

{ #category : #testMethod2 }
SmTClassTestP2Test >> testMethod2SecondLevelSendersInsidePackageWithTestOutside [
	"Data for tests: this method calls a method not from the same package, which itself calls a method. Both are not from the same package as this test (both are located in SmartTestDataOutsideP1)"
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P1') asClass new method2SecondLevelSendersInsidePackageWithTestOutside.
]

{ #category : #testMethod2 }
SmTClassTestP2Test >> testMethod2SecondLevelSendersOutsidePackageWithTestOutside [
"Data for tests: this method calls a method from the same package (located in SmartTestDataOutsideP1), which itself calls a method not from the same package (located in SmartTestDataOutsideP1)"
"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
	^ ('SmTClass','P2') asClass new method2SecondLevelSendersOutsidePackageWithTestOutside.
]
