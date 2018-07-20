tests
testChangeRunnerStrategy
	"Test changement of the runner in the setting (throught SmTRules methods)"

	SmTRules runner: self runnerStrategy.
	self assert: SmTRules testFinder testRunner equals: self runnerStrategy.
	self assert: SmTRules testFinder testingStrategy runner equals: self runnerStrategy.