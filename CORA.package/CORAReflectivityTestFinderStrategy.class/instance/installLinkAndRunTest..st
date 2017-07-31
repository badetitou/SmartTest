accessing
installLinkAndRunTest: aTestMethod
	| testEnv |
	self initializeLink.

	testEnv := TestExecutionEnvironment new.
	[testEnv beActiveDuring: [
		testEnv runTestCase: aTestMethod]] on: Exception do: [ ]