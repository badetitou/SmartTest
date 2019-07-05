"
I test the strategy SendersFinder with different filters.
In order to be sure that those test are not considered as callers of the modified method and as references to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method.


The tests are described below:
The modified method’s name always contains « method1 » and will be refered to as method1.
The modified method can be used directly by a test, in this case the test’s name contains « testMethod1 » 
The modified method can be used by a method (and then a test), then the method’s name contains « method2 »
Method 2 will then be called by a test (the second level sender of method1) and this test's name contains « testMethod2 »
The names of the methods and tests will be followed by a identificator. This will result in very long names but it is necessary in order to be unique and explicit.
Being unique, the senders of each method are controlled and consequently the tests are independent the one from the others.

If the name of a test contains « FirstLevelSender » then the corresponding method2 and testMethod2 do not exist.
If the name of a test contains « SecondLevelSender » then the corresponding testMethod1 does not exist.

We use the Classification Tree Method to represent the tests (see https://en.wikipedia.org/wiki/Classification_Tree_Method) . 

We will use the Classification Tree Method for the description of the tests.
Exemple for the first line of the following description: 
Test FirstLevelSendersInside : the modified method ""method1FirstLevelSendersInside"" is located in package P1 and testMethod1FirstLevelSendersInside calls method1FirstLevelSendersInside and is located inside the package P1.


Simple tests (no references):
Method: 	TestMethod1 		Method2 			TestMethod2 	Test Identificator
Package: 	P1	P2				P1	P2				P1	P2
			•	|				|	|				|	|			FirstLevelSendersInside
			|	•				|	|				|	|			FirstLevelSendersOutside
			|	|				•	|				•	|			SecondLevelSendersInsideTestInside
			|	|				•	|				|	•			SecondLevelSendersInsideTestOutside
			|	|				|	•				•	|			SecondLevelSendersOutsideTestInside
			|	|				|	•				|	•			SecondLevelSendersOutsideTestOutside


Simple tests (no references):
Method: 			TestMethod1 						Method2 																	TestMethod2 										Test Identificator
Package: 			P2									P1				P2								P3							P1		P2 	
Reference: 		Class 	Method Package 			|		Class 	Method Package 		Class 	Method Package 			| 		NoRef 	Class 	Method Package
					•		|		 |					|		|		|		 |				|		|		 |					|		|		|		|		 |					FirstLevelSendersInsideWithRefInClass
					|		•		 |					|		|		|		 |				|		|		 |					|		|		|		|		 |					FirstLevelSendersInsideWithRefInMethod
					|		|		 •					•		|		|		 |				|		|		 |					|		|		•		|		 |					SecondLevelSendersInsideTestOutsideWithRefInClass
					|		|		 |					•		|		|		 |				|		|		 |					|		|		|		•		 |					SecondLevelSendersInsideTestOutsideWithRefInMethod
					|		|		 |					•		|		|		 |				|		|		 |					|		|		|		|		 •					SecondLevelSendersInsideTestOutsideWithRefInPackage
					|		|		 |					|		•		|		 |				|		|		 |					•		|		|		|		 |					SecondLevelSendersOutsidesideTestInsideWithRefInClass
					|		|		 |					|		|		•		 |				|		|		 |					•		|		|		|		 |					SecondLevelSendersOutsidesideTestInsideWithRefInMethod
					|		|		 |					|		|		|		 •				|		|		 |					•		|		|		|		 |					SecondLevelSendersOutsidesideTestInsideWithRefInPackage
					|		|		 |					|		|		|		 |				|		•		 |					|		|		|		•		 |					SecondLevelSendersOutsidesideTestOutsideWithRefInMethod
"
Class {
	#name : #SmTFilterAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'smartFinder',
		'testMethod1FirstLevelSendersOutsidePackage',
		'testMethod2SecondLevelSendersInsidePackageWithTestInside',
		'testMethod2SecondLevelSendersInsidePackageWithTestOutside',
		'testMethod2SecondLevelSendersOutsidePackageWithTestOutside',
		'testmethod1FirstLevelSendersInsidePackage',
		'testMethod1FirstLevelSendersInsidePackage',
		'testMethod2SecondLevelSendersOutsidePackageWithTestInside'
	],
	#category : #'SmartTest-Tests-Filter'
}

{ #category : #testing }
SmTFilterAbstractTest class >> isAbstract [

	^ self  == SmTFilterAbstractTest
]

{ #category : #helpers }
SmTFilterAbstractTest >> instanceVariableNamed: aInstVarName fromClass: aClass [ 
	^ (aClass instanceVariables select:[:instVar| instVar = aInstVarName ])first .
]

{ #category : #helpers }
SmTFilterAbstractTest >> searchTestMethodsFor: aCompiledMethod [
	
	^ smartFinder researchTestsForMethod: aCompiledMethod .
]

{ #category : #helpers }
SmTFilterAbstractTest >> searchTestMethodsForAClass: aClass [
	
	^ smartFinder smtFinder searchTestsForAClass: aClass.
]

{ #category : #helpers }
SmTFilterAbstractTest >> searchTestsForInstVar: aInstanceVariable ofClass: aClass [
	^ smartFinder smtFinder searchTestsForAInstVar: aInstanceVariable OfClass: aClass
]

{ #category : #running }
SmTFilterAbstractTest >> setUp [
	super setUp.
	smartFinder := SmartFinder new.
	smartFinder filter: SmTDefaultPackagesFilter new.
	testMethod1FirstLevelSendersInsidePackage := (('SmTClass' , 'TestP1') asClass
		>> ('test' , 'Method1FirstLevelSendersInsidePackage') asSymbol) asRingDefinition.
	testMethod1FirstLevelSendersOutsidePackage := (('SmTClass' , 'TestP2Test') asClass
		>> ('test' , 'Method1FirstLevelSendersOutsidePackage') asSymbol) asRingDefinition.
	testMethod2SecondLevelSendersInsidePackageWithTestInside := (('SmTClass' , 'TestP1')
		asClass >> ('test' , 'Method2SecondLevelSendersInsidePackageWithTestInside') asSymbol)
		asRingDefinition.
	testMethod2SecondLevelSendersOutsidePackageWithTestInside := (('SmTClass' , 'TestP1')
		asClass >> ('test' , 'Method2SecondLevelSendersOutsidePackageWithTestInside') asSymbol)
		asRingDefinition.
	testMethod2SecondLevelSendersInsidePackageWithTestOutside := (('SmTClass' , 'TestP2Test')
		asClass >> ('test' , 'Method2SecondLevelSendersInsidePackageWithTestOutside') asSymbol)
		asRingDefinition.
	testMethod2SecondLevelSendersOutsidePackageWithTestOutside := (('SmTClass' , 'TestP2Test')
		asClass
		>> ('test' , 'Method2SecondLevelSendersOutsidePackageWithTestOutside') asSymbol)
		asRingDefinition
]

{ #category : #running }
SmTFilterAbstractTest >> tearDown [
	smartFinder clean.
	super tearDown
]

{ #category : #'test -modification on class' }
SmTFilterAbstractTest >> testClassAbstractTestCaseDoesntRedefineMethod [
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound testMethodSubClass1 testMethodSubClass2 |
	testsFound := self searchTestMethodsForAClass: (('SmTP1ClassTestAbstractTestCase') asClass).
	testMethodSubClass1 := RGMethodDefinition className: ('SmTP1ClassTestSubClassDoesntRedefine','Method') selector:('testModificationOnClassAbstract','TestCase') isMetaSide:	false.
	testMethodSubClass2 := RGMethodDefinition className: ('SmTP1ClassTestSubclassRedefines','Method') selector:('testModificationOnClassAbstract','TestCase') isMetaSide:	false.
	self assert: (testsFound includes: testMethodSubClass1).
	self assert: (testsFound includes: testMethodSubClass2).
]

{ #category : #'test -modification on class' }
SmTFilterAbstractTest >> testClassAbstractTestCaseRedefinesMethod [
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound testMethodSubClass1 testMethodSubClass2 |
	testsFound := self searchTestMethodsForAClass: (('SmTP1ClassTestAbstractTestCase') asClass).
	testMethodSubClass2 := RGMethodDefinition className: ('SmTP1ClassTestSubclassRedefines','Method') selector:('testModificationOnClassAbstract','TestCase') isMetaSide:	false.
	self assert: (testsFound includes: testMethodSubClass2).
]

{ #category : #'test -modification on class' }
SmTFilterAbstractTest >> testClassInheritanceSubClass1 [
	<CORATestBlacklisted>
	| testsFound testMethodSubClass2 |
	testsFound := self searchTestMethodsForAClass: (('SmTP1ClassTestSubClass','DoesntRedefineMethod') asClass).
	testMethodSubClass2 := RGMethodDefinition className: ('SmTP1ClassTestSubClass','DoesntRedefineMethod') selector:('testModificationOnClass','AbstractTestCase') isMetaSide:	false.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: testMethodSubClass2).
]

{ #category : #'test -modification on class' }
SmTFilterAbstractTest >> testClassInsidePackageWithRef [
"In this test, we want to assert that if the class is used in a method, we find the tests related to this method."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassModificationOnClass','InsidePackageWithRef') asClass.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: ((('SmTClassModificationOnClassInsidePackageTestOutside','WithRefTest') asClass  >> ('testRefToSmTClassModificationOnClassInsidePackageWithRef') asSymbol) asRingDefinition )).
]

{ #category : #'test -modification on class' }
SmTFilterAbstractTest >> testClassOutsidePackageWithRef [
"In this test, we want to assert that if the class is used in a method, we find the tests related to this method."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassModificationOnClass','OutsidePackageWithRef') asClass.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: ((('SmTClassModificationOnClassOutsidePackageWith','RefTest') asClass  >> ('testRefToSmTClassModificationOnClass','OutsidePackageWithRef') asSymbol) asRingDefinition )).
]

{ #category : #'test -modification on class' }
SmTFilterAbstractTest >> testClassSimpleTestCase [
"In this test we want to assert that SmartTest finds the test owned directly by a class."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassModificationOnClass','SimpleTestCase') asClass.
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: ((('SmTClassModificationOnClass','SimpleTestCase') asClass  >> ('testModificationOnClass','SimpleTestCase') asSymbol) asRingDefinition )).
]

{ #category : #'test -modification on class' }
SmTFilterAbstractTest >> testClassTestsInside [
"In this test we want to assert that SmartTest finds the test owned directly by a class."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassTest','P2Test') asClass.
	self assert: (testsFound includes: ((('SmTClassTest','P2Test') asClass  >> ('testMethod1FirstLevelSendersOutsideWithRefIn','Class') asSymbol) asRingDefinition )).
]

{ #category : #'test - extension method' }
SmTFilterAbstractTest >> testExtensionMethodFirstLevelSendersInside [
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP2Test') asClass >> ('extensionMethod1FirstLevelSenders','Inside') asSymbol).
	self assert: (testsFound includes: ((('SmT','ClassTestP1') asClass >> ('testExtensionMethod1FirstLevelSenders','Inside') asSymbol) asRingDefinition)).
	
]

{ #category : #'test - extension method' }
SmTFilterAbstractTest >> testExtensionMethodFirstLevelSendersOutside [
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP2Test') asClass >> ('extensionMethod1FirstLevelSenders','Outside') asSymbol).
	self assert: (testsFound includes: ((('SmT','ClassTestP2Test') asClass >> ('testExtensionMethod1FirstLevelSenders','Outside') asSymbol) asRingDefinition )).
	
]

{ #category : #'test - extension method' }
SmTFilterAbstractTest >> testExtensionMethodSecondLevelSendersInside [
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP1') asClass >> ('extensionMethod1','SecondLevelSenders') asSymbol).
	
	self deny: (testsFound includes: ((('SmT','ClassTestP3') asClass >> ('testExtensionMethod2','SecondLevelSenders') asSymbol) asRingDefinition )).
	
]

{ #category : #'test - extension method' }
SmTFilterAbstractTest >> testExtensionTestInside [
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP4') asClass >> ('method1ExtensionTest','Inside') asSymbol).
	
	self deny: (testsFound includes: ((('SmT','ClassTestP3') asClass >> ('testMethod1ExtensionTest','Inside') asSymbol) asRingDefinition )).
	
]

{ #category : #'test - instance variable' }
SmTFilterAbstractTest >> testInstVarInsideClass [
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound aInstVar|
	aInstVar := self instanceVariableNamed: 'instVarModificationOnVariableInsideClass' fromClass: (('SmTClassP1ModificationOn','VariableInsideClassTest') asClass).
	testsFound := self searchTestsForInstVar: aInstVar ofClass: (('SmTClassP1ModificationOn','VariableInsideClassTest') asClass).
	self assert: (testsFound includes: (('SmTClassP1ModificationOn','VariableInsideClassTest') asClass >> ('testModificationOnVariable','InsideClass')asSymbol)asRingDefinition ).
	
]

{ #category : #'test - instance variable' }
SmTFilterAbstractTest >> testInstVarInsidePackage [
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound aInstVar|
	aInstVar := self instanceVariableNamed: 'instVarModificationOnVariableInsidePackage' fromClass: ('SmTClassP1ModificationOn','Variable') asClass.
	testsFound := self searchTestsForInstVar: aInstVar ofClass: ('SmTClassP1ModificationOn','Variable') asClass.
	self assert: (testsFound includes: (('SmTClassP1ModificationOnVariable','InsidePackageTest') asClass >> ('testModificationOnVariable','InsidePackage')asSymbol)asRingDefinition ).
	
]

{ #category : #'test - instance variable' }
SmTFilterAbstractTest >> testInstVarOutsidePackage [
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound aInstVar|
	aInstVar := self instanceVariableNamed: 'instVarModificationOnVariableOutsidePackage' fromClass: ('SmTClassP1ModificationOnVariable') asClass .
	testsFound := self searchTestsForInstVar: aInstVar ofClass: ('SmTClassP1ModificationOnVariable') asClass.
	self assert: (testsFound includes: (('SmTClassP1ModificationOnVariable','OutsidePackageTest') asClass >> ('testModificationOnVariable','OutsidePackage')asSymbol)asRingDefinition ).
	
]

{ #category : #'test - standard method - first level sender' }
SmTFilterAbstractTest >> testStandardMethodFirstLevelSendersInsidePackage [
	<CORATestBlacklisted>
	"method1 is called by testMethod1, a tests owned by the same package as method1, the only test found should be testMethod1"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmTClass','P1') asClass >> ('method1','FirstLevelSendersInsidePackage') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: testMethod1FirstLevelSendersInsidePackage).
	
	
	
]

{ #category : #'test - standard method - first level sender' }
SmTFilterAbstractTest >> testStandardMethodFirstLevelSendersOutsidePackage [
	<CORATestBlacklisted>
	"method1 is called by testMethod2, a test not owned by the same package as method1, thus it should not be found"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','FirstLevelSendersOutsidePackage') asSymbol).
	self assert: (testsFound isEmpty ).
	self deny:   (testsFound includes: testMethod1FirstLevelSendersOutsidePackage).
	
	
	
]

{ #category : #'test - standard method - first level sender' }
SmTFilterAbstractTest >> testStandardMethodFirstLevelSendersOutsidePackageWithRefInClass [
	<CORATestBlacklisted>
	"method1 is called by testMethod1"
	"P1 : method1
	 P2 : testMethod1, the reference is made in the class of testMethod1"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	 
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1FirstLevelSendersOutsideWithRefIn','Class') asClass >> ('method1','FirstLevelSendersWithRefInClass') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod1FirstLevelSendersOutsideWithRefIn','Class') asSymbol) asRingDefinition ).
]

{ #category : #'test - standard method - first level sender' }
SmTFilterAbstractTest >> testStandardMethodFirstLevelSendersOutsidePackageWithRefInMethod [
	<CORATestBlacklisted>
	"method1 is called by testMethod1"
	"P1 : method1
	 P2 : testMethod1, the reference is made in testMethod1"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1FirstLevelSendersOutsideWithRefIn','Method') asClass >> ('method1','FirstLevelSendersWithRefInMethod') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod1FirstLevelSendersOutsideWithRefIn','Method') asSymbol) asRingDefinition ).
]

{ #category : #'test - standard method - first level sender' }
SmTFilterAbstractTest >> testStandardMethodFirstLevelSendersOutsidePackageWithRefInPackage [
	<CORATestBlacklisted>
	"method1 is called by testMethod1"
	"P1 : method1
	 P2 : testMethod1, the reference is made in the package of testMethod1"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1FirstLevelSendersOutsideWithRefIn','Package') asClass >> ('method1FirstLevelSendersWithRefIn','Package') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod1FirstLevelSendersOutsideWithRefIn','Package') asSymbol) asRingDefinition ).
	
]

{ #category : #'test - standard method - second level sender' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersInsidePackageWithTestInside [
	<CORATestBlacklisted>
	"method1 is called by method2, which itself is called by testMethod2, a tests owned by the same package as myMethod1, thus testMethod2 should be found.
	We never go out of the package so it's normal."
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersInsidePackageWithTestInside') asSymbol).
	self assert: testsFound size equals: 1.
	self assert: (testsFound includes: testMethod2SecondLevelSendersInsidePackageWithTestInside ).
	
	
	
]

{ #category : #'test - standard method - second level sender' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersInsidePackageWithTestOutside [
	<CORATestBlacklisted>
	"method1 is called by method2, which itself is called by testMethod2, a test not owned by the same package as method1, thus testMethod2 should not be found. 
	We go out of the package once so it's normal hat the test is not found."
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersInsidePackageWithTestOutside') asSymbol).
	self assert: (testsFound isEmpty ).
	self deny: (testsFound includes: testMethod2SecondLevelSendersInsidePackageWithTestOutside ).
	
	
	
]

{ #category : #'test - standard method - second level sender - with references' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersInsideTestOutsideWithRefInClass [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and method2
	 P2 : testMethod2, the reference is made in the class of testMethod2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersInsideTestOutsideWithRefIn','Class') asClass >> ('method1SecondLevelSendersInsideTestOutsideWithRefIn','Class') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod2SecondLevelSenderInsideTestOutsideWithRefIn','Class') asSymbol) asRingDefinition ).
	
]

{ #category : #'test - standard method - second level sender - with references' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersInsideTestOutsideWithRefInMethod [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and method2
	 P2 : testMethod2, the reference is made in testMethod2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersInsideTestOutsideWithRefIn','Method') asClass >> ('method1SecondLevelSendersInsideTestOutsideWithRefIn','Method') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod2SecondLevelSenderInsideTestOutsideWithRefIn','Method')asSymbol) asRingDefinition ).
	
]

{ #category : #'test - standard method - second level sender - with references' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersInsideTestOutsideWithRefInPackage [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and method2
	 P2 : testMethod2, the reference is made in the package of testMethod2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersInsideTestOutsideWithRefIn','Package') asClass >> ('method1SecondLevelSendersInsideTestOutsideWithRefIn','Package') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTest','P2Test') asClass >> ('testMethod2SecondLevelSenderInsideTestOutsideWithRefIn','Package') asSymbol) asRingDefinition ).
	
]

{ #category : #'test - standard method - second level sender' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersOutsidePackageWithTestInside [
	<CORATestBlacklisted>
	"method1 is called by method2, which itself is called by testMethod2, thus testMethod2 should not be found.
	We go out of the package once so it's normal hat the test is not found."
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersOutsidePackageWithTestInside') asSymbol).
	self assert: (testsFound isEmpty ).	
	self deny: (testsFound includes: testMethod2SecondLevelSendersOutsidePackageWithTestInside ).
	
	
	
]

{ #category : #'test - standard method - second level sender' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersOutsidePackageWithTestOutside [
	<CORATestBlacklisted>
	"method1 is called by method2, which itself is called by testMethod2, thus testMethod2 should not be found.
	We go out of the package once so it's normal hat the test is not found."
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersOutsidePackageWithTestOutside') asSymbol).
	self assert: (testsFound isEmpty ).
	self deny: (testsFound includes: testMethod2SecondLevelSendersOutsidePackageWithTestOutside ).
	
	
	
]

{ #category : #'test - standard method - second level sender - with references' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersOutsideTestInsideWithRefInClass [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and testMethod2
	 P2 : method2, the reference is made in the class of method2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersOutsideTestInsideWithRefIn','Class') asClass >> ('method1SecondLevelSendersOutsideTestInsideWithRefIn','Class') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTest','P1') asClass >> ('testMethod2SecondLevelSendersOutsideTestInsideWithRefIn','Class') asSymbol) asRingDefinition ).
	
]

{ #category : #'test - standard method - second level sender - with references' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersOutsideTestInsideWithRefInMethod [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and testMethod2
	 P2 : method2, the reference is made in method2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersOutsideTestInsideWithRefIn','Method') asClass >> ('method1SecondLevelSendersOutsideTestInsideWithRefIn','Method') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTest','P1') asClass >> ('testMethod2SecondLevelSendersOutsideTestInsideWithRefIn','Method') asSymbol) asRingDefinition ).
	
]

{ #category : #'test - standard method - second level sender - with references' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersOutsideTestInsideWithRefInPackage [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : method1 and testMethod2
	 P2 : method2, the reference is made in the package of method2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersOutsideTestInsideWithRefIn','Package') asClass >> ('method1SecondLevelSendersOutsideTestInsideWithRefIn','Package') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTest','P1') asClass >> ('testMethod2SecondLevelSendersOutsideTestInsideWithRefIn','Package') asSymbol) asRingDefinition ).
	
]

{ #category : #'test - standard method - second level sender - with references' }
SmTFilterAbstractTest >> testStandardMethodSecondLevelSendersOutsideTestOutsideWithRefInMethod [
	<CORATestBlacklisted>
	"method1 is called by method 2,itself called by testMethod1"
	"P1 : Class1 >> method1 
	 P2 : Class2 >> method2, the reference to Class1 is made in method2
	 P3 : Class3 >> testMethod2, the reference to Class1 is made in testMethod2"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClassP1SecondLevelSendersOutsideTestOutsideWithRefIn','Method') asClass >> ('method1SecondLevelSendersOutsideTestOutsideWithRefIn','Method') asSymbol).
	self assert: testsFound isEmpty.
	self deny: (testsFound includes: (('SmTClassTestP3SecondLevelSenderOutsideTestOutsideWithRefIn','Method') asClass >> ('testMethod2SecondLevelSenderOutsideTestOutsideWithRefIn','Method') asSymbol) asRingDefinition ).
	
]
