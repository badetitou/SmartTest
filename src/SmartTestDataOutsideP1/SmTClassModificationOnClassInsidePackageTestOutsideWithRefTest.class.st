"
Data for SmartTest tests on the testForClass:.

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

We will use this that to assert that SmartTest behaves correctly when dealing with inherited methods ans class.

This class has a test that references the class SmTClassModificationOnClassInsidePackageWithRef 
"
Class {
	#name : #SmTClassModificationOnClassInsidePackageTestOutsideWithRefTest,
	#superclass : #TestCase,
	#category : 'SmartTestDataOutsideP1-ModificationOnClass-Tests'
}

{ #category : #tests }
SmTClassModificationOnClassInsidePackageTestOutsideWithRefTest >> testRefToSmTClassModificationOnClassInsidePackageWithRef [
SmTClassModificationOnClassInsidePackageWithRef new.
]
