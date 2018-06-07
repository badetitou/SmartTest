private - search
recursiveSearchForAClass: aClass inPackages: packagesToLookAt alreadyVisited: alreadyVisitedClass
	| foundMethods |
	foundMethods := Set new.
	aClass isTestCase
				ifTrue: [ (aClass methods select: [ :aMethod | aMethod isTestMethod ]) do: [ :eachTestMethod | foundMethods addAll: (self methodsFor: eachTestMethod) ].
					aClass allTestSelectors do: [ :each | foundMethods add: (RGMethodDefinition className: aClass name selector: each isMetaSide: false) ] ].
  	foundMethods addAll: ((aClass allCallsOn )flatCollect: [ :aRGMethodDefinition | self recursiveSearchForAStandardMethod: aRGMethodDefinition inPackages: packagesToLookAt] ).
	(aClass subclasses)
		reject: [ :aSubClass |
			| reject |
			reject := (filter shouldEntityBeFiltered: aSubClass inPackages: packagesToLookAt) or: [ alreadyVisitedClass includes: aSubClass ].
			alreadyVisitedClass add: aSubClass.
			reject ]
		thenDo: [ :aSubClass | 
			foundMethods add: aSubClass .
			foundMethods addAll: (self recursiveSearchForAClass: aSubClass inPackages: packagesToLookAt alreadyVisited: alreadyVisitedClass)].
	^ foundMethods