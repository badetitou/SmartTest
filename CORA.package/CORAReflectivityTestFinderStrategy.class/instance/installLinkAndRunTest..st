accessing
installLinkAndRunTest: aTestMethod
	| suite testRunner |
	self initializeLink.
	testRunner := TestRunner new.
	suite := TestSuite new.
	suite addTest: aTestMethod.
	testRunner runSuite: suite