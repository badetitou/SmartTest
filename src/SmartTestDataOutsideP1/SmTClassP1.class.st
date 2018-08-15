"
Data for SmartTest tests on the filters (default, defaultClass, restricted package).

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

In the tests, it is always the methods whose name contains 'method1' that are modified. If the name contains first level, the methods are directly called by a test. If the name contains SecondLevel, they are called by an another method (whose name contains 'method2').

This class is not referenced anywhere (we used concatenation to be sure).

"
Class {
	#name : #SmTClassP1,
	#superclass : #Object,
	#category : 'SmartTestDataOutsideP1-ModificationOnMethod-WithoutRef'
}

{ #category : #method1 }
SmTClassP1 >> method1FirstLevelSendersInsidePackage [
	"Data for tests: method directly called by a test method from the same package"
	
" the behaviour of this method is not relevant."
]

{ #category : #method1 }
SmTClassP1 >> method1FirstLevelSendersOutsidePackage [
	"Data for tests: method directly called by a test method but not from the same package"
	
" the behaviour of this method is not relevant."
]

{ #category : #method1 }
SmTClassP1 >> method1SecondLevelSendersInsidePackageWithTestInside [
		"Data for tests: method called by another method , which itself is called by a test from the same package"
	
" the behaviour of this method is not relevant."
]

{ #category : #method1 }
SmTClassP1 >> method1SecondLevelSendersInsidePackageWithTestOutside [
			"Data for tests: method called by another method from the same package, which itself is called by a test not from the same package"
	
" the behaviour of this method is not relevant."
]

{ #category : #method1 }
SmTClassP1 >> method1SecondLevelSendersOutsidePackageWithTestInside [
	"Data for tests: method called by another method not from the same package, which itself is called by a test from the same package"
	
" the behaviour of this method is not relevant."
]

{ #category : #method1 }
SmTClassP1 >> method1SecondLevelSendersOutsidePackageWithTestOutside [
	"Data for tests: method called by another method not from the same package, which itself is called by a test not from the same package"
	
" the behaviour of this method is not relevant."
]

{ #category : #method2 }
SmTClassP1 >> method2SecondLevelSendersInsidePackageWithTestInside [
	"Data for tests: this method calls a method from the same package, 
	this method is called by a test from the same package"
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
^ ('SmTClass','P1') asClass new method1SecondLevelSendersInsidePackageWithTestInside.
]

{ #category : #method2 }
SmTClassP1 >> method2SecondLevelSendersInsidePackageWithTestOutside [	
	"Data for tests: this method calls a method from the same package, 
	this method is called by a test not from the same package"
	"In order to be sure that this method does not reference any class, we don't use directly the class but go through their name with a concatenation and then transform them into class"
^('SmTClass','P1') asClass  new method1SecondLevelSendersInsidePackageWithTestOutside.
]
