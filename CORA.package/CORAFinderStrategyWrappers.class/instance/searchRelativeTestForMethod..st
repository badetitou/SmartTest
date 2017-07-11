accessing
searchRelativeTestForMethod: aCompiledMethod
	| wrappers testRunner methods suite packages packageBaseName |
	packageBaseName := self filter parseCompiledMethodPackageBaseName: aCompiledMethod.
	packages := self collectAllRelativePackages: packageBaseName.
	methods := packages flatCollect: [ :aPackage | (SystemNavigation default allClassesInPackageNamed: aPackage packageName) flatCollect: [ :aClass | aClass allMethods ] ].
	wrappers := {(TestCoverage on: aCompiledMethod methodReference)} asOrderedCollection.
	testRunner := TestRunner new.
	wrappers do: [ :each | each install ] displayingProgress: [ :aClass | 'Processing ' , aClass asString ] every: 1.
	(self collectRelativeTestMethodOfMethods: methods)
		do: [ :aTestMethod | 
			| aToResetAfterMarkCollection |
			suite := TestSuite new.
			suite addTest: aTestMethod.
			testRunner runSuite: suite.

			aToResetAfterMarkCollection := wrappers select: [ :each | each hasRun ].
			self addATest: aTestMethod toACollectionOfMethod: aToResetAfterMarkCollection.
			aToResetAfterMarkCollection do: [ :each | each unmark ] ]
		displayingProgress: [ :aClass | 'Processing ' , aClass asString ]
		every: 1.
	wrappers do: [ :each | each uninstall ] displayingProgress: [ :aClass | 'Processing ' , aClass asString ] every: 1