protocol
analyseAndRemoveProxyFor: aTestCase
	| aCORATestCoverageFinder |
	aCORATestCoverageFinder := self new.
	aCORATestCoverageFinder updateCacheAndUnmarkFrom: (wrappers at: aTestCase) forMethod: aTestCase.
	(wrappers at: aTestCase) do: [ :each | each uninstall ]