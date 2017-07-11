accessing
fillMethodToTestCorrespondance
	| wrappers testRunner methods suite |
	methods := self availableMethods collect: #methodReference.
	wrappers := methods collect: [ :each | TestCoverage on: each ].
	testRunner := TestRunner new.
	wrappers
		do: [ :each | 
			each install.]
		displayingProgress: [ :aClass | 'Processing ' , aClass name ]
		every: 1.
	(self collectRelativeTestMethodOfMethods: self availableTestMethods )
		do: [ :aTestMethod | 
			| aToResetAfterMarkCollection |
			suite := TestSuite new.
			suite addTest: aTestMethod.
			testRunner runSuite: suite.
			aToResetAfterMarkCollection := wrappers select: [ :each | each hasRun ].
			self addATest: aTestMethod toACollectionOfMethod: aToResetAfterMarkCollection.
			aToResetAfterMarkCollection do: [ :each | each unmark ] ]
		displayingProgress: [ :aClass | 'Processing ' , aClass name ]
		every: 1.
	wrappers do: [ :each | each uninstall ] displayingProgress: [ :aClass | 'Processing ' , aClass name ] every: 1