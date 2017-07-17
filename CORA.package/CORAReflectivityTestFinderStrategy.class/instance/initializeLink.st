accessing
initializeLink
	| link |
	link := MetaLink new
		metaObject: [ :ctxt | 
			| aCompiledTestCase |
			aCompiledTestCase := self extractCurrentTestExecutionFormContext: ctxt.
			self initializeLinkInCompiledMethod: aCompiledTestCase.
			self currentTestExecution: aCompiledTestCase ];
		selector: #value:;
		arguments: #(context);
		optionOneShot: true.
	(TestExecutionEnvironment >> #runTestCase:) ast link: link