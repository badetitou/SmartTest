api
installProxyFor: aTestCase
	self currentTestExecution: aTestCase.
	self addATest: aTestCase toMethod: aTestCase.
	self initializeLinkInCompiledMethod: aTestCase class >> aTestCase selector