api
buildCacheFromTestSuite: aTestSuite
	aTestSuite flatCollectTests do: [ :aTestCase | self installProxyFor: aTestCase. aTestCase run ].
	MetaLink uninstallAll