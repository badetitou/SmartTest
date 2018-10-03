"
I test the strategy SendersFinder with the filter RestrictedPackage.
The filter should accept any test that is owned by a package whose name matches the regex.

Here we look for tests in the package SmartDataTestOutsideP1 (this is defined in the SetUp method).

In order to be sure that those test are not considered as callers of the modified method and as references to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method.
"
Class {
	#name : #SmTSendersFilterTestWithRestrictedPackage,
	#superclass : #SmTFilterAbstractTest,
	#category : #'SmartTest-Tests-Filter'
}

{ #category : #running }
SmTSendersFilterTestWithRestrictedPackage >> setUp [
	"Here we want to test the SmTRestrictedPackageFilter with the static strategy 'sendersFinder'. We only look for the tests located in SmartTestDataOutsideP1."

	super setUp.
	self timeLimit: 60 seconds.
	smartFinder filter: (SmTSpecifyPackagesNameFilter packagesRegex: 'SmartTestDataOutsideP1')
]

{ #category : #tests }
SmTSendersFilterTestWithRestrictedPackage >> testClassOutsidePackageWithRef [
"In this test, we want to assert that if the class is used in a method, we find the tests related to this method."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassModificationOnClass','OutsidePackageWithRef') asClass.
	self assert: testsFound size equals: 0.
]

{ #category : #tests }
SmTSendersFilterTestWithRestrictedPackage >> testExtensionMethodFirstLevelSendersOutside [
	<CORATestBlacklisted>
	| testsFound |
	testsFound := self searchTestMethodsFor:( ('SmT','ExtensionP2Test') asClass >> ('extensionMethod1FirstLevelSenders','Outside') asSymbol).
	self deny: (testsFound includes: ((('SmT','ClassTestP2Test') asClass >> ('testExtensionMethod1FirstLevelSenders','Outside') asSymbol) asRingDefinition )).
]

{ #category : #tests }
SmTSendersFilterTestWithRestrictedPackage >> testInstVarOutsidePackage [
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound aInstVar|
	aInstVar := self instanceVariableNamed: 'instVarModificationOnVariableOutsidePackage' fromClass: ('SmTClassP1ModificationOnVariable') asClass .
	testsFound := self searchTestsForInstVar: aInstVar ofClass:('SmTClassP1ModificationOnVariable') asClass .
	self assert: testsFound size equals: 0.
	
]
