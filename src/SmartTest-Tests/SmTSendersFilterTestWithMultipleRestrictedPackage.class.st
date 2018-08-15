"
I test the strategy SendersFinder with the filter RestrictedPackage.
The filter should accept any test that is owned by a package whose name matches the regex.

Here we look for tests in the package SmartDataTestOutsideP1 AND SmartDataTestOutsideP2  End of statement list encountered ->(this is defined in the SetUp method).
The results are different than the results with only one package.

In order to be sure that those test are not considered as callers of the modified method and as references to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method.
"
Class {
	#name : #SmTSendersFilterTestWithMultipleRestrictedPackage,
	#superclass : #SmTFilterAbstractTest,
	#category : 'SmartTest-Tests-Filter'
}

{ #category : #running }
SmTSendersFilterTestWithMultipleRestrictedPackage >> setUp [
	"Here we want to test the SmTRestrictedPackageFilter with the static strategy 'sendersFinder'. We look for the tests located in both SmartTestDataOutsideP1 and P2."

	super setUp.
	self timeLimit: 60 seconds.
	smartFinder
		filter:
			(SmTSpecifyPackagesNameFilter packagesRegex: 'SmartTestDataOutsideP1|SmartTestDataOutsideP2')
]

{ #category : #tests }
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodFirstLevelSendersOutsidePackage [
	<CORATestBlacklisted>
	"MyMethod1 is called by testMyMethod2, a test not owned by the same package as myMethod1 but its package matches the regex so it should be found"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','FirstLevelSendersOutsidePackage') asSymbol).
	self assert: testsFound size equals: 1 .
	self assert:   (testsFound includes: testMethod1FirstLevelSendersOutsidePackage).
	
	
	
]

{ #category : #tests }
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodFirstLevelSendersOutsidePackageWithRefInClass [
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
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodFirstLevelSendersOutsidePackageWithRefInMethod [
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
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodFirstLevelSendersOutsidePackageWithRefInPackage [
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

{ #category : #running }
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodSecondLevelSendersInsidePackageWithTestOutside [
	<CORATestBlacklisted>
	"method1 is called by method2, which itself is called by testMethod2, both methods (the test and the method) are not owned by the same package as myMethod1 but their packages matches the regex so it should be found"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"

	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersInsidePackageWithTestOutside') asSymbol).
	self assert: testsFound size equals: 1 .
	self assert:    (testsFound includes: testMethod2SecondLevelSendersInsidePackageWithTestOutside ).
	
	
	
]

{ #category : #tests }
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodSecondLevelSendersInsideTestOutsideWithRefInClass [
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
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodSecondLevelSendersInsideTestOutsideWithRefInMethod [
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
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodSecondLevelSendersInsideTestOutsideWithRefInPackage [
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

{ #category : #running }
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodSecondLevelSendersOutsidePackageWithTestInside [
	<CORATestBlacklisted>
	"method1 is called by method2, which itself is called by testMethod2, both methods (the test and the method) are not owned by the same package as myMethod1 but their packages matches the regex so it should be found"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersOutsidePackageWithTestInside') asSymbol).
	self assert: testsFound size equals: 1 .
	self assert:    (testsFound includes: testMethod2SecondLevelSendersOutsidePackageWithTestInside ).
	
	
	
]

{ #category : #running }
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodSecondLevelSendersOutsidePackageWithTestOutside [
	<CORATestBlacklisted>
	"method1 is called by method2, which itself is called by testMethod2, both methods (the test and the method) are not owned by the same package as myMethod1 but their packages matches the regex so it should be found"
	"In order to be sure that this test is not considered as a caller of the modified method and a reference to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method"
	| testsFound |
	testsFound := self searchTestMethodsFor: ( ('SmTClass','P1') asClass >> ('method1','SecondLevelSendersOutsidePackageWithTestOutside') asSymbol).
	self assert: testsFound size equals: 1 .
	self assert: (testsFound includes: testMethod2SecondLevelSendersOutsidePackageWithTestOutside ).
	
	
	
]

{ #category : #tests }
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodSecondLevelSendersOutsideTestInsideWithRefInClass [
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
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodSecondLevelSendersOutsideTestInsideWithRefInMethod [
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
SmTSendersFilterTestWithMultipleRestrictedPackage >> testStandardMethodSecondLevelSendersOutsideTestInsideWithRefInPackage [
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
