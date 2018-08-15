"
Data for SmartTest tests on the filters (default, defaultClass, restricted package).

Methods of this class have long name in order to be unique and explicit.
Being unique, the senders of each method are mastered and consequently the tests are independent the one from the others.

We will use this that to assert that SmartTest behaves correctly when dealing with inherited methods.
"
Class {
	#name : #SmTP1InheritanceTest,
	#superclass : #TestCase,
	#category : 'SmartTestDataOutsideP1-ModificationOnMethod-Tests'
}

{ #category : #testing }
SmTP1InheritanceTest class >> isAbstract [

	^ self  == SmTP1InheritanceTest 
]

{ #category : #tests }
SmTP1InheritanceTest >> testMethod1Inheritance [

	('SmTP1', 'Inheritance') asClass new method1Inheritance.
]
