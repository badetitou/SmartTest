api
buildCacheFromTestSuite: aTestSuite
"tr := TestRunner new.
tr open.
testSuites := tr allSelectedTestSuites.
ts := TestSuite new.
(testSuites flatCollect: [ :ts | ts tests ]) do: [ :atest | ts addTest: atest ].
[sf := SmartFinder new.
sf smtFinder: SmTTestCoverageTestFinderStrategy new.
sf buildCacheFromTestSuite: ts.
sf cacheValues ] timeToRun 
"
	| listOfPackage methodToWrap |
	aTestSuite.
	listOfPackage := (aTestSuite tests flatCollect: [ :aTestCase | self class collectPackagesFromName: aTestCase class package name ]) asSet collect: #packageName.
	methodToWrap := Set new.
	methodToWrap addAll: (self collectMethodToTestForPackagesNamed: listOfPackage).
	methodToWrap addAll: (self collectClassToTestForPackagesNamed: listOfPackage).
	methodToWrap := methodToWrap intersection: self availableMethods.
	wrappers at: aTestSuite put: (methodToWrap asOrderedCollection collect: [ :each | (SmTTestCoverage on: each methodReference) finder: self ]).
	(wrappers at: aTestSuite) do: [ :each | each install ] displayingProgress: [ :aClass | 'Installing ' , aClass asString ] every: 1.
	aTestSuite tests
		do: [ :aTest | 
			self currentTestExecution: aTest.
			aTest run.
			(wrappers at: aTestSuite) do: [ :each | each unmark ] ].
	(wrappers at: aTestSuite) do: [ :each | each uninstall ]