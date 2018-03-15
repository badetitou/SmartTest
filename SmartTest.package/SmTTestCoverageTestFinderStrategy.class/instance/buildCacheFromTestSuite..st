api
buildCacheFromTestSuite: aTestSuite
	| listOfPackage methodToWrap |
	aTestSuite.
	listOfPackage := aTestSuite tests collect: [ :aTestCase | aTestCase compiledMethod package name ].
	methodToWrap := Set new.
	methodToWrap addAll: (self collectMethodToTestForPackagesNamed: listOfPackage).
	"methodToWrap addAll: (self collectClassToTestForPackagesNamed: listOfPackage)."
	methodToWrap := methodToWrap intersection: self availableMethods.
	wrappers at: aTestSuite put: (methodToWrap asOrderedCollection collect: [ :each | (SmTTestCoverage on: each methodReference) finder: self ]).
	(wrappers at: aTestSuite) do: [ :each | each install ] displayingProgress: [ :aClass | 'Installing ' , aClass asString ] every: 1.
	aTestSuite tests
		do: [ :aTest | 
			self currentTestExecution: aTest.
"			aTest run."
			(wrappers at: aTestSuite) do: [ :each | each unmark ] ].
	(wrappers at: aTestSuite) do: [ :each | each uninstall ]