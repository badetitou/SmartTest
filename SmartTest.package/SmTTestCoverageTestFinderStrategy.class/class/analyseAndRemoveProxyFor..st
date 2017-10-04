protocol
analyseAndRemoveProxyFor: aTestCase
	| aCORATestCoverageFinder |
	aCORATestCoverageFinder := self new.
	aCORATestCoverageFinder addImpactedTestFromWrapper: aTestCase theTestMethod: wrappers.
	wrappers do: [ :each | each uninstall ]