api
installProxyFor: aTestCase
	| methodToWrap listOfPackage |
	self currentTestExecution: aTestCase.
	self addATest: aTestCase toMethodReference: aTestCase methodReference.
	listOfPackage := OrderedCollection new.
	listOfPackage add: (self extractPackageBaseName: (aTestCase methodReference compiledMethod package name)).
	methodToWrap := Set new.
	methodToWrap addAll: (self collectMethodToTestForPackagesNamed: listOfPackage).
	methodToWrap := methodToWrap intersection: self availableMethods.
	wrappers
		at: aTestCase
		put:
			(methodToWrap asOrderedCollection
				collect: [ :each | (SmTTestCoverage on: each methodReference) finder: self ]).
	((wrappers at: aTestCase) sort: [ :a :b | a name < b name ])
		do: [ :each | each install ]
		displayingProgress: [ :aClass | 'Installing ' , aClass asString ]
		every: 1