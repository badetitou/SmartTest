initialization
initializeLink
	| link |
	link := MetaLink new
		metaObject: [ :ctxt | 
			| aCompiledTestCase |
			aCompiledTestCase := self extractCurrentTestExecutionFromContext: ctxt.
			self initializeLinkInCompiledMethod: aCompiledTestCase.
			self currentTestExecution: aCompiledTestCase ];
		selector: #value:;
		arguments: #(context);
		level: 0;
		optionOneShot: true.
	(TestExecutionEnvironment >> #runTestCase:) ast link: link