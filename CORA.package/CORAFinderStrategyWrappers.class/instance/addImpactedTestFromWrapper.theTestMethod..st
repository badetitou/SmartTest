accessing
addImpactedTestFromWrapper: aTestMethod theTestMethod: wrappers
	| aToResetAfterMarkCollection suite testRunner |
	testRunner := TestRunner new.
	suite := TestSuite new.
	suite addTest: aTestMethod.
	testRunner runSuite: suite.
	aToResetAfterMarkCollection := wrappers
		select: [ :each | each hasRun ].
	self
		addATest: aTestMethod
		toACollectionOfMethod: aToResetAfterMarkCollection.
	^ aToResetAfterMarkCollection do: [ :each | each unmark ]