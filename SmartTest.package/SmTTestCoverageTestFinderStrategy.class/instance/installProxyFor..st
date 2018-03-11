api
installProxyFor: aTestCase
	| methodToWrap listOfPackage |
	self currentTestExecution: aTestCase.
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
				collect: [ :each | (SmTTestCoverage on: each methodReference) finder: self ]).
	((wrappers at: aTestCase) sort: [ :a :b | a name < b name ])
		do: [ :each | each install ]
		displayingProgress: [ :aClass | 'Installing ' , aClass asString ]
		every: 1