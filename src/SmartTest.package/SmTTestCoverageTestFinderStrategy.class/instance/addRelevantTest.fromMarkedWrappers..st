jenkins
addRelevantTest: aTestMethod fromMarkedWrappers: wrappers
	| suite testRunner |
	testRunner := TestRunner new.
	suite := TestSuite new.
	suite addTest: aTestMethod.
	testRunner runSuite: suite.
	self updateCacheAndUnmarkFrom: wrappers forMethod: aTestMethod .
