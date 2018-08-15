"
Data for SmartTest tests on the testForAnInstanceVariable:.

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

We will use this that to assert that SmartTest behaves correctly when dealing with modifications on instance variables.

It contains different instance variables that are used in tests. Each variable has only one test that calls them.
"
Class {
	#name : #SmTClassP1ModificationOnVariable,
	#superclass : #Object,
	#instVars : [
		'instVarModificationOnVariableInsidePackage',
		'instVarModificationOnVariableOutsidePackage'
	],
	#category : 'SmartTestDataOutsideP1-ModificationOnVariable'
}

{ #category : #accessing }
SmTClassP1ModificationOnVariable >> instVarModificationOnVariableInsidePackage [
	^ instVarModificationOnVariableInsidePackage
]

{ #category : #accessing }
SmTClassP1ModificationOnVariable >> instVarModificationOnVariableInsidePackage: anObject [
	instVarModificationOnVariableInsidePackage := anObject
]

{ #category : #accessing }
SmTClassP1ModificationOnVariable >> instVarModificationOnVariableOutsidePackage [
	^ instVarModificationOnVariableOutsidePackage
]

{ #category : #accessing }
SmTClassP1ModificationOnVariable >> instVarModificationOnVariableOutsidePackage: anObject [
	instVarModificationOnVariableOutsidePackage := anObject
]
