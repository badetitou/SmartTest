api
analyseAndRemoveProxyFor: aTestCase
	(wrappers at: aTestCase) do: [ :each | each uninstall ]