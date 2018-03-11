api
installProxyFor: aTestCase
	self currentTestExecution: aTestCase.
	self initializeLinkInCompiledMethod: aTestCase class >> aTestCase selector