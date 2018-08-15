"
Data for SmartTest tests on the testForAnInstanceVariable:.

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

We will use this that to assert that SmartTest behaves correctly when dealing with modifications on instance variables.

This class uses an instance variable contained inside a class in a different package.
"
Class {
	#name : #SmTClassP1ModificationOnVariableOutsidePackageTest,
	#superclass : #TestCase,
	#instVars : [
		'instVarModificationOnVariableOutsidePackage'
	],
	#category : 'SmartTestDataOutsideP2-ModificationOnVariable-Tests'
}

{ #category : #tests }
SmTClassP1ModificationOnVariableOutsidePackageTest >> testModificationOnVariableOutsidePackage [
|anObject|
anObject := ('SmTClassP1','ModificationOnVariable')asClass new.
anObject instVarModificationOnVariableOutsidePackage
]
