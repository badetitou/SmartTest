protocol
installProxyFor: aTestCase
	| methodToWrap aCORATestCoverageFinder listOfPackage|
	listOfPackage := OrderedCollection new.
	listOfPackage add: (aTestCase class >> aTestCase selector) package name.
	aCORATestCoverageFinder := self new.
	methodToWrap := Set new.
	methodToWrap addAll: (aCORATestCoverageFinder collectMethodToTestForPackagesNamed: listOfPackage).
	methodToWrap addAll: (aCORATestCoverageFinder collectClassToTestForPackagesNamed: listOfPackage).
	methodToWrap := methodToWrap intersection: aCORATestCoverageFinder availableMethods.
	wrappers at: aTestCase put: (methodToWrap asOrderedCollection collect: [ :each | TestCoverage on: each methodReference ]).
	(wrappers at: aTestCase) do: [ :each | each install ] displayingProgress: [ :aClass | 'Processing ' , aClass asString ] every: 1