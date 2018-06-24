running
testChangeCacheStrategy
	"Test changement of the runner in the setting (throught SmTRules methods)"

	SmTRules cacheStrategy: self cacheStrategy.
	self assert: (SmTRules testFinder cacheStrategy isKindOf: self cacheStrategy).
	self assert: (SmTRules testFinder smtFinder cache isKindOf: self cacheStrategy)