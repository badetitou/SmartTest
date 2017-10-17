protocol
analyseAndRemoveProxyFor: aTestCase
	| aCORATestCoverageFinder |
	aCORATestCoverageFinder := self new.
	aCORATestCoverageFinder updateCacheAndUnmarkFrom: wrappers forMethod: aTestCase.
	(wrappers at: aTestCase) do: [ :each | each uninstall ]