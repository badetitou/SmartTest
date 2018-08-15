"
Data for SmartTest tests on the testForAnInstanceVariable:.

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

We will use this that to assert that SmartTest behaves correctly when dealing with modifications on instance variables.
"
Class {
	#name : #SmTClassP1ModificationOnVariableInsidePackageTest,
	#superclass : #TestCase,
	#instVars : [
		'instVarModificationOnVariable'
	],
	#category : 'SmartTestDataOutsideP1-ModificationOnVariable-Tests'
}

{ #category : #tests }
SmTClassP1ModificationOnVariableInsidePackageTest >> testModificationOnVariableInsidePackage [
|anObject|
anObject := ('SmTClassP1','ModificationOnVariable')asClass new.
anObject instVarModificationOnVariableInsidePackage 
]
