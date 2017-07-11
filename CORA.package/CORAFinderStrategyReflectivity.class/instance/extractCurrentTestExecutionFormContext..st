accessing
extractCurrentTestExecutionFormContext: ctxt
	| aTestCase aCompiledTestCase |
	aTestCase := ctxt arguments at: 1.
	aCompiledTestCase := aTestCase class >> aTestCase selector.
	^ aCompiledTestCase