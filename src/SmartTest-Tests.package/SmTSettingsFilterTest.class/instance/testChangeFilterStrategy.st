tests
testChangeFilterStrategy
	"Test changement of the runner in the setting (throught SmTRules methods)"

	SmTRules filter: self filterStrategy.
	self assert: (SmTRules testFinder filter isKindOf: self filterStrategy).
	self assert: (SmTRules testFinder smtFinder filter isKindOf: self filterStrategy)