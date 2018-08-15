"
Data for SmartTest tests on the filters (default, defaultClass, restricted package).

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

We will use this that to assert that SmartTest behaves correctly when dealing with inherited methods.
"
Class {
	#name : #SmTP1InheritanceSubClass1Test,
	#superclass : #SmTP1InheritanceTest,
	#category : 'SmartTestDataOutsideP1-ModificationOnMethod-Tests'
}

{ #category : #tests }
SmTP1InheritanceSubClass1Test >> testMethod1Inheritance [
	super testMethod1Inheritance.
	"The behaviour of this test is irrelevant".
]
