"
Data for SmartTest tests on the DefaultClassPackage filter.

Methods of this class have long name in order to be unique and explicit.

Being unique, the senders of each method are controlled and consequently the tests are independent the one from the others.
In this Class, we implement methods that make references to different class to the package SMartTestDataOutsideP1.
"
Class {
	#name : #SmTClassP2ReferencesInPackage,
	#superclass : #Object,
	#category : 'SmartTestDataOutsideP2-ModificationOnMethod-References'
}

{ #category : #referenceInPackage }
SmTClassP2ReferencesInPackage >> referenceToSmTClassP1FirstLevelSendersOutsideWithRefInPackage [
^SmTClassP1FirstLevelSendersOutsideWithRefInPackage
]

{ #category : #referenceInPackage }
SmTClassP2ReferencesInPackage >> referenceToSmTClassP1SecondLevelSendersInsideTestOutsideWithRefInPackage [
^SmTClassP1SecondLevelSendersInsideTestOutsideWithRefInPackage
]

{ #category : #referenceInPackage }
SmTClassP2ReferencesInPackage >> referenceToSmTClassP1SecondLevelSendersOutsideTestInsideWithRefInPackage [
^SmTClassP1SecondLevelSendersOutsideTestInsideWithRefInPackage
]
