accessing
initializeLink
	| link |
	link := MetaLink new
		metaObject: [ :ctxt | 
			| aCompiledTestCase |
			aCompiledTestCase := self extractCurrentTestExecutionFromContext: ctxt.
			self initializeLinkInCompiledMethod: aCompiledTestCase.
			self currentTestExecution: aCompiledTestCase methodReference ];
		selector: #value:;
		arguments: #(context);
		optionOneShot: true.
	(TestExecutionEnvironment >> #runTestCase:) ast link: link