"
Data for SmartTest tests on the filters (defaultClass).

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are controlled and consequently the tests are independent the one from the others.

In the tests, it is always the methods whose name contains 'method1' that are modified. If the name contains first level, the methods are directly called by a test. If the name contains SecondLevel, they are called by an another method (whose name contains 'method2').

If the name of the test contains 'method2', the test use the method method2, if the test contains 'method1', the test directly uses the modified method.


The methods and tests in this package are not located in the same package as the modified method.
"
Class {
	#name : #SmTClassTestP3,
	#superclass : #TestCase,
	#category : 'SmartTestDataOutsideP3'
}

{ #category : #tests }
SmTClassTestP3 >> testExtensionMethod2SecondLevelSenders [
('SmTExtension','P3') asClass >> #extensionMethod2SecondLevelSenders .
]

{ #category : #tests }
SmTClassTestP3 >> testMethod1ExtensionTestInside [
('SmTExtension','P4') asClass >> #method1ExtensionTestInside

]
