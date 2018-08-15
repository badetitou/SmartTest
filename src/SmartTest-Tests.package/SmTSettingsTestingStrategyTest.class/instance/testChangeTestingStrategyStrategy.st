tests
testChangeTestingStrategyStrategy
	"Test changement of the runner in the setting (throught SmTRules methods)"

	SmTRules strategy: self getTestingStrategy .
	self assert: (SmTRules testFinder testingStrategy isKindOf:  self getTestingStrategy ).
	self assert: SmTRules testFinder testingStrategy runner equals: SmTRules runner.
	self assert: SmTRules testFinder testingStrategy finder equals: SmTRules testFinder smtFinder