protocol
installProxyFor: aTestCase
	| methodToWrap aCORATestCoverageFinder wrappers listOfPackage|
	listOfPackage := OrderedCollection new.
	listOfPackage add: (aTestCase class >> aTestCase selector) package name.
	aCORATestCoverageFinder := self new.
	methodToWrap := Set new.
	methodToWrap addAll: (aCORATestCoverageFinder collectMethodToTestForPackagesNamed: listOfPackage).
	methodToWrap addAll: (aCORATestCoverageFinder collectClassToTestForPackagesNamed: listOfPackage).
	methodToWrap := methodToWrap intersection: aCORATestCoverageFinder availableMethods.
	wrappers := methodToWrap asOrderedCollection collect: [ :each | TestCoverage on: each methodReference ].
	wrappers do: [ :each | each install ] displayingProgress: [ :aClass | 'Processing ' , aClass asString ] every: 1