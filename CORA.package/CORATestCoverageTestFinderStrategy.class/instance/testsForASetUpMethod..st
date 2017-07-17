API
testsForASetUpMethod: aCompiledMethod
	"If the method is a TestCase setUp, returns all the tests of this TestCase and its subclasses"

	aCompiledMethod isTestSetUpMethod ifFalse: [ ^ #() ].

	^aCompiledMethod methodClass
		withAllSubclasses
		flatCollect: #allTestMethods.