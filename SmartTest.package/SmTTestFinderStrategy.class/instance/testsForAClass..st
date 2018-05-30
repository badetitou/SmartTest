accessing
testsForAClass: aClass
	"This method returns all the tests related to a class.
	If it is a testCase, it returns all the tests owned by the class.
	If the class is abstract, we compute the subclasses inherited tests methods and we add them to the test found.
	We also want to find the tests related to methods that uses the class."

	| testsFound |
	testsFound := Set new.
	aClass isTestCase
		ifTrue: [ (aClass methods select: [ :aMethod | aMethod isTestMethod ]) do: [ :eachTestMethod | testsFound addAll: (self methodsFor: eachTestMethod) ] ].
	aClass subclasses do: [ :aSubClass | testsFound addAll: (self testsForAClass: aSubClass) ].
	aClass allCallsOn do: [ :aRGMethodDefinition | testsFound addAll: (self methodsFor: aRGMethodDefinition method) ].
	^ testsFound