protocol
prepareInJenkinsForPackagesNamed: aCollectionOfPackageNamed
	| methodToWrap aCORATestCoverageFinder wrappers |
	aCORATestCoverageFinder := self new.
	methodToWrap := Set new. 
	methodToWrap addAll: (aCORATestCoverageFinder collectMethodToTestForPackagesNamed: aCollectionOfPackageNamed).
	methodToWrap addAll: (aCORATestCoverageFinder collectClassToTestForPackagesNamed: aCollectionOfPackageNamed).
	methodToWrap := methodToWrap intersection: aCORATestCoverageFinder availableMethods.
	methodToWrap do: [ :anExploredMethod | aCORATestCoverageFinder testsForMethod: anExploredMethod  ].
	wrappers := methodToWrap asOrderedCollection collect: [ :each | TestCoverage on: each methodReference ].
	wrappers do: [ :each | each install ] displayingProgress: [ :aClass | 'Processing ' , aClass asString ] every: 1.
	[ (aCORATestCoverageFinder collectRelativeTestMethodOfMethods: methodToWrap)
		do: [ :aTestMethod | aCORATestCoverageFinder addImpactedTestFromWrapper: aTestMethod theTestMethod: wrappers ]
		displayingProgress: [ :aClass | 'Processing ' , aClass asString ]
		every: 1 ]
		ensure: [ wrappers do: [ :each | each uninstall ] ].
	CORAFinderSettings finder: self