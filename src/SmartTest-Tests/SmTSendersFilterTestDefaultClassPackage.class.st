"
I test the strategy SendersFinder with the filterDefaultClassPackage.
The filter should accept any test that is owned by :
	- the package of the modified method;
	- a package that references the class of the modified method.
	
In order to be sure that those test are not considered as callers of the modified method and as references to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method.
"
Class {
	#name : #SmTSendersFilterTestDefaultClassPackage,
	#superclass : #SmTFilterAbstractTest,
	#category : #'SmartTest-Tests-Filter'
}

{ #category : #running }
SmTSendersFilterTestDefaultClassPackage >> setUp [
"Here we want to test the SmTDefaultPackagesFilter with the static strategy 'sendersFinder' "
	super setUp.
	smartFinder filter: SmTDefaultClassPackagesFilter new.
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testExtensionTestInside [
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP4') asClass >> ('method1ExtensionTest','Inside') asSymbol).
	
	self assert: (testsFound includes: ((('SmT','ClassTestP3') asClass >> ('testMethod1ExtensionTest','Inside') asSymbol) asRingDefinition )).
	
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testInstVarOutsidePackage [
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound aInstVar|
	aInstVar := self instanceVariableNamed: 'instVarModificationOnVariableOutsidePackage' fromClass: ('SmTClassP1ModificationOnVariable') asClass .
	testsFound := self searchTestsForInstVar: aInstVar ofClass: ('SmTClassP1ModificationOnVariable') asClass.
	self assert: testsFound size equals: 0.
	
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testStandardMethodFirstLevelSendersOutsidePackageWithRefInClass [
	<CORATestBlacklisted>
	"method1 is called by testMethod1"
	"P1 : method1
	 P2 : testMethod1, the reference is made in the class of testMethod1"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	 
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1FirstLevelSendersOutsideWithRefIn','Class') asClass >> ('method1','FirstLevelSendersWithRefInClass') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod1FirstLevelSendersOutsideWithRefIn','Class') asSymbol) asRingDefinition ).
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testStandardMethodFirstLevelSendersOutsidePackageWithRefInMethod [
	<CORATestBlacklisted>
	"method1 is called by testMethod1"
	"P1 : method1
	 P2 : testMethod1, the reference is made in testMethod1"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1FirstLevelSendersOutsideWithRefIn','Method') asClass >> ('method1','FirstLevelSendersWithRefInMethod') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod1FirstLevelSendersOutsideWithRefIn','Method') asSymbol) asRingDefinition ).
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testStandardMethodFirstLevelSendersOutsidePackageWithRefInPackage [
	<CORATestBlacklisted>
	"method1 is called by testMethod1"
	"P1 : method1
	 P2 : testMethod1, the reference is made in the package of testMethod1"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1FirstLevelSendersOutsideWithRefIn','Package') asClass >> ('method1FirstLevelSendersWithRefIn','Package') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod1FirstLevelSendersOutsideWithRefIn','Package') asSymbol) asRingDefinition ).
	
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testStandardMethodSecondLevelSendersInsideTestOutsideWithRefInClass [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and method2
	 P2 : testMethod2, the reference is made in the class of testMethod2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersInsideTestOutsideWithRefIn','Class') asClass >> ('method1SecondLevelSendersInsideTestOutsideWithRefIn','Class') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod2SecondLevelSenderInsideTestOutsideWithRefIn','Class') asSymbol) asRingDefinition ).
	
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testStandardMethodSecondLevelSendersInsideTestOutsideWithRefInMethod [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and method2
	 P2 : testMethod2, the reference is made in testMethod2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersInsideTestOutsideWithRefIn','Method') asClass >> ('method1SecondLevelSendersInsideTestOutsideWithRefIn','Method') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod2SecondLevelSenderInsideTestOutsideWithRefIn','Method')asSymbol) asRingDefinition ).
	
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testStandardMethodSecondLevelSendersInsideTestOutsideWithRefInPackage [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and method2
	 P2 : testMethod2, the reference is made in the package of testMethod2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersInsideTestOutsideWithRefIn','Package') asClass >> ('method1SecondLevelSendersInsideTestOutsideWithRefIn','Package') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod2SecondLevelSenderInsideTestOutsideWithRefIn','Package') asSymbol) asRingDefinition ).
	
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testStandardMethodSecondLevelSendersOutsideTestInsideWithRefInClass [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and testMethod2
	 P2 : method2, the reference is made in the class of method2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersOutsideTestInsideWithRefIn','Class') asClass >> ('method1SecondLevelSendersOutsideTestInsideWithRefIn','Class') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTest','P1') asClass >> ('testMethod2SecondLevelSendersOutsideTestInsideWithRefIn','Class') asSymbol) asRingDefinition ).
	
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testStandardMethodSecondLevelSendersOutsideTestInsideWithRefInMethod [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and testMethod2
	 P2 : method2, the reference is made in method2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersOutsideTestInsideWithRefIn','Method') asClass >> ('method1SecondLevelSendersOutsideTestInsideWithRefIn','Method') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTest','P1') asClass >> ('testMethod2SecondLevelSendersOutsideTestInsideWithRefIn','Method') asSymbol) asRingDefinition ).
	
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testStandardMethodSecondLevelSendersOutsideTestInsideWithRefInPackage [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and testMethod2
	 P2 : method2, the reference is made in the package of method2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersOutsideTestInsideWithRefIn','Package') asClass >> ('method1SecondLevelSendersOutsideTestInsideWithRefIn','Package') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTest','P1') asClass >> ('testMethod2SecondLevelSendersOutsideTestInsideWithRefIn','Package') asSymbol) asRingDefinition ).
	
]

{ #category : #tests }
SmTSendersFilterTestDefaultClassPackage >> testStandardMethodSecondLevelSendersOutsideTestOutsideWithRefInMethod [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : Class1 >> method1 
	 P2 : Class2 >> method2, the reference to Class1 is made in method2
	 P3 : Class3 >> testMethod2, the reference to Class1 is made in testMethod2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersOutsideTestOutsideWithRefIn','Method') asClass >> ('method1SecondLevelSendersOutsideTestOutsideWithRefIn','Method') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: (('SmTClassTestP3SecondLevelSenderOutsideTestOutsideWithRefIn','Method') asClass >> ('testMethod2SecondLevelSenderOutsideTestOutsideWithRefIn','Method') asSymbol) asRingDefinition ).
	
]
