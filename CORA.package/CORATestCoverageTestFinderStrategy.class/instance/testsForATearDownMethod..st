API
testsForATearDownMethod: aCompiledMethod
	"If the method is a TestCase tearDown, returns all the tests of this TestCase"

	aCompiledMethod isTestTearDownMethod ifFalse: [ ^ #() ].

	^aCompiledMethod methodClass
		withAllSubclasses
		flatCollect: #allTestMethods.