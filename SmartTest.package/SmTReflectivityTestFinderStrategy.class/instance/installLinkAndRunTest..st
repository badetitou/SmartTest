accessing
installLinkAndRunTest: aTestMethod
	| testEnv |
	self currentTestExecution: aTestMethod.
	self initializeLinkInCompiledMethod: (aTestMethod class >> aTestMethod selector).

	testEnv := TestExecutionEnvironment new.
	[testEnv beActiveDuring: [
		testEnv runTestCase: aTestMethod]] on: Exception do: [  ].