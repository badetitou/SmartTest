accessing
testsForAClass: aClass forTheFinder: aFinder
	"This method returns all the tests related to a class.
	If it is a testCase, it returns all the tests owned by the class.
	If the class is am abstract testCase, we compute the subclasses inherited tests methods and we add them to the test found.
	We also want to find the tests related to methods that uses the class."

	| testsFound |
	testsFound := Set new.
	aClass isTestCase
		ifTrue: [ (aClass methods select: [ :aMethod | aMethod isTestMethod ]) do: [ :eachTestMethod | testsFound addAll: (aFinder methodsFor: eachTestMethod) ].
			aClass allTestSelectors do: [ :each | testsFound add: (RGMethodDefinition className: aClass name selector: each isMetaSide: false) ] ].
	aClass subclasses do: [ :aSubClass | testsFound addAll: (self testsForAClass: aSubClass forTheFinder: aFinder) ].
	testsFound addAll: (aClass allCallsOn flatCollect: [ :aRGMethodDefinition | aFinder methodsFor: aRGMethodDefinition compiledMethod ]).
	^ testsFound