accessing
installLinkAndRunTest: aTestMethod
	| suite testRunner |
	testRunner := TestRunner new.
	suite := TestSuite new.
	suite addTest: aTestMethod.
	testRunner runSuite: suite.