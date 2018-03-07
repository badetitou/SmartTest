protocol
analyseAndRemoveProxyFor: aTestCase
	self
		updateCacheAndUnmarkFrom: (wrappers at: aTestCase)
		forMethod: aTestCase.
	(wrappers at: aTestCase) do: [ :each | each uninstall ]