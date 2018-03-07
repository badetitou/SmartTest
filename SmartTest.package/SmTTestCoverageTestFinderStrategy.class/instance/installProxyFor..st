api
installProxyFor: aTestCase
	| methodToWrap listOfPackage |
	listOfPackage := OrderedCollection new.
	listOfPackage add: (aTestCase class >> aTestCase selector) package name.
	methodToWrap := Set new.
	methodToWrap
		addAll: (self collectMethodToTestForPackagesNamed: listOfPackage).
	methodToWrap
		addAll: (self collectClassToTestForPackagesNamed: listOfPackage).
	methodToWrap := methodToWrap intersection: self availableMethods.
	wrappers
		at: aTestCase
		put:
			(methodToWrap asOrderedCollection
				collect: [ :each | TestCoverage on: each methodReference ]).
	(wrappers at: aTestCase)
		do: [ :each | each install ]
		displayingProgress: [ :aClass | 'Processing ' , aClass asString ]
		every: 1