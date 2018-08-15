tests
testChangeFinderStrategy
	"Test changement of the runner in the setting (throught SmTRules methods)"

	SmTRules finder: self finderStrategy.
	self assert: (SmTRules testFinder smtFinder isKindOf: self finderStrategy).
	self assert: (SmTRules testFinder smtFinder filter isKindOf: SmTRules filter).
	self assert: (SmTRules testFinder smtFinder cache isKindOf: SmTRules cacheStrategy).
	self assert: (SmTRules testFinder smtFinder filter isKindOf: SmTRules filter)