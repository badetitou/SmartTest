"
I test the strategy SendersFinder with the filter DefaultPackage.
The filter should accept any test that is owned by :
	- the package of the modified method;
	
In order to be sure that those test are not considered as callers of the modified method and as references to its class, we don't use directly the class and the method but go through their name with a concatenation and then transform them into class or method.
"
Class {
	#name : #SmTSendersFilterTestDefaultPackage,
	#superclass : #SmTFilterAbstractTest,
	#category : 'SmartTest-Tests-Filter'
}

{ #category : #tests }
SmTSendersFilterTestDefaultPackage >> testClassOutsidePackageWithRef [
"In this test, we want to assert that if the class is used in a method, we find the tests related to this method."
	<CORATestBlacklisted>
	| testsFound  |
	testsFound := self searchTestMethodsForAClass: ('SmTClassModificationOnClass','OutsidePackageWithRef') asClass.
	self assert: testsFound size equals: 0.
]

{ #category : #tests }
SmTSendersFilterTestDefaultPackage >> testInstVarOutsidePackage [
"In this test we want to assert that if the modified class has subclasses, SmartTest finds all the inherited methods (implemented or not)"
	<CORATestBlacklisted>
	| testsFound aInstVar|
	aInstVar := self instanceVariableNamed: 'instVarModificationOnVariableOutsidePackage' fromClass: ('SmTClassP1ModificationOnVariable') asClass .
	testsFound := self searchTestsForInstVar: aInstVar ofClass: ('SmTClassP1ModificationOnVariable') asClass.
	self assert: testsFound size equals: 0.
	
]
