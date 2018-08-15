initialization
testChangeCacheClassFinder
	| cacheTmp |
	smartFinder smtFinder.
	cacheTmp := SmTBasicCacheStrategy new.
	smartFinder cacheStrategy: cacheTmp.
	self assert: smartFinder smtFinder cache equals: cacheTmp