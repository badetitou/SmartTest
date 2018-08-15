"
Data for SmartTest tests on the filters (default, defaultClass, restricted package).

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

In the tests, it is always the methods whose name contains 'method1' that are modified. If the name contains first level, the methods are directly called by a test. If the name contains SecondLevel, they are called by an another method (whose name contains 'method2').

This class is not referenced anywhere (we used concatenation to be sure).

The methods and tests in this package are not located in the same package as the modified method.
"
Class {
	#name : #SmTClassP2,
	#superclass : #Object,
	#category : 'SmartTestDataOutsideP2-ModificationOnMethod-WithoutRef'
}

{ #category : #method2 }
SmTClassP2 >> method2SecondLevelSendersOutsidePackageWithTestInside [
	"Data for tests: this method calls a method not from the same package (located in SmartTestDataOutsideP1), 
	this method is called by a test from the same package"
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
^ ('SmTClass','P1') asClass new method1SecondLevelSendersOutsidePackageWithTestInside
]

{ #category : #method2 }
SmTClassP2 >> method2SecondLevelSendersOutsidePackageWithTestOutside [
	"Data for tests: this method calls a method not from the same package (located in SmartTestDataOutsideP1), 
	this method is called by a test not from the same package (located in SmartTestDataOutsideP1)"
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
^ ('SmTClass','P1') asClass new method1SecondLevelSendersOutsidePackageWithTestOutside
]
