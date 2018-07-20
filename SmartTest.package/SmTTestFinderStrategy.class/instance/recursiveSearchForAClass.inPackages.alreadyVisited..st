private - search
recursiveSearchForAClass: aClass inPackages: packagesToLookAt alreadyVisited: alreadyVisitedClass
	| testsFound allCallsOnClass |
	testsFound := Set new.
	aClass isTestCase
		ifTrue: [ (aClass methods select: [ :aMethod | aMethod isTestMethod ]) do: [ :eachTestMethod | testsFound addAll: (self methodsFor: eachTestMethod) ].
			aClass allTestSelectors do: [ :each | testsFound add: (RGMethodDefinition className: aClass name selector: each isMetaSide: false) ] ].
	testsFound
		addAll:
			((aClass allCallsOn select: [ :aCallOn | (filter shouldEntityBeFilteredOut: aCallOn inPackages: packagesToLookAt) not ])
				flatCollect: [ :aRGMethodDefinition | self methodsFor: aRGMethodDefinition compiledMethod]).
	aClass subclasses
		reject: [ :aSubClass | 
			| reject |
			reject := (filter shouldEntityBeFilteredOut: aSubClass inPackages: packagesToLookAt) or: [ alreadyVisitedClass includes: aSubClass ].
			alreadyVisitedClass add: aSubClass.
			reject ]
		thenDo: [ :aSubClass | 
			testsFound add: aSubClass.
			testsFound addAll: (self recursiveSearchForAClass: aSubClass inPackages: packagesToLookAt alreadyVisited: alreadyVisitedClass) ].
	^ testsFound