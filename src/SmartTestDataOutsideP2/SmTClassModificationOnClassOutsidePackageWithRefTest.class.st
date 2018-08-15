"
Data for SmartTest tests on the testForAnInstanceVariable:.

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

We will use this that to assert that SmartTest behaves correctly when dealing with modifications on instance variables.

This class has an instance variable used inside the class in a test the instance variable is located outside of this package (in ""SmartTestDataOutsideP1"").
"
Class {
	#name : #SmTClassModificationOnClassOutsidePackageWithRefTest,
	#superclass : #TestCase,
	#category : 'SmartTestDataOutsideP2-ModificationOnClass-Tests'
}

{ #category : #tests }
SmTClassModificationOnClassOutsidePackageWithRefTest >> testRefToSmTClassModificationOnClassOutsidePackageWithRef [
SmTClassModificationOnClassOutsidePackageWithRef new.
]
